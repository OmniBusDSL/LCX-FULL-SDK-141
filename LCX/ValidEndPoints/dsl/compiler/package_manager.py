#!/usr/bin/env python3
"""
LCX Package Manager - Import and manage external .lcx files
Allows community to share strategies and workflows
"""

import os
import re
from pathlib import Path
from typing import List, Dict, Tuple, Set
import json

class PackageManager:
    """Manages .lcx package imports and dependencies"""

    def __init__(self, root_dir: str = "."):
        self.root_dir = Path(root_dir)
        self.imported_files: Set[str] = set()
        self.packages: Dict[str, Dict] = {}
        self.search_paths = [
            self.root_dir,
            self.root_dir / "strategies",
            self.root_dir / "packages",
            self.root_dir / "lib",
            self.root_dir / "examples"
        ]

    def resolve_import(self, import_path: str) -> Tuple[bool, str]:
        """Resolve import path to actual file"""
        # Handle quotes
        import_path = import_path.strip('"\'')

        for search_path in self.search_paths:
            full_path = search_path / import_path

            # Try with .lcx extension
            if not import_path.endswith('.lcx'):
                full_path = search_path / f"{import_path}.lcx"

            if full_path.exists() and full_path.is_file():
                return True, str(full_path.resolve())

        return False, f"Package not found: {import_path}"

    def load_package(self, filepath: str) -> Tuple[bool, str]:
        """Load a package file"""
        filepath = Path(filepath)

        if not filepath.exists():
            return False, f"File not found: {filepath}"

        if filepath in self.imported_files:
            return True, f"Already imported: {filepath}"

        self.imported_files.add(str(filepath))

        # Parse package metadata
        try:
            with open(filepath, 'r') as f:
                content = f.read()

            metadata = self._extract_metadata(content)
            operations = self._extract_operations(content)

            self.packages[str(filepath)] = {
                "path": str(filepath),
                "metadata": metadata,
                "operations": operations,
                "dependencies": self._extract_dependencies(content)
            }

            return True, f"Loaded package: {filepath.name}"
        except Exception as e:
            return False, f"Error loading package: {e}"

    def process_imports(self, content: str) -> Tuple[str, List[str]]:
        """Process all IMPORT statements in DSL file"""
        import_pattern = r'^IMPORT\s+["\']([^"\']+)["\']\s*$'
        processed_content = content
        imports = []
        errors = []

        for line_num, line in enumerate(content.split('\n'), 1):
            if 'IMPORT' in line:
                match = re.match(import_pattern, line.strip())
                if match:
                    import_path = match.group(1)
                    success, result = self.resolve_import(import_path)

                    if success:
                        pkg_success, pkg_msg = self.load_package(result)
                        if pkg_success:
                            imports.append(result)
                            # Remove IMPORT line from processed content
                            processed_content = processed_content.replace(line, "")
                        else:
                            errors.append(f"Line {line_num}: {pkg_msg}")
                    else:
                        errors.append(f"Line {line_num}: {result}")

        return processed_content, errors

    def _extract_metadata(self, content: str) -> Dict:
        """Extract package metadata from comments"""
        metadata = {
            "name": None,
            "version": None,
            "description": None,
            "author": None
        }

        # Look for metadata in first 10 lines
        lines = content.split('\n')[:10]
        for line in lines:
            if '@name' in line:
                metadata['name'] = line.split('@name')[-1].strip()
            elif '@version' in line:
                metadata['version'] = line.split('@version')[-1].strip()
            elif '@description' in line:
                metadata['description'] = line.split('@description')[-1].strip()
            elif '@author' in line:
                metadata['author'] = line.split('@author')[-1].strip()

        return metadata

    def _extract_operations(self, content: str) -> List[str]:
        """Extract all operation names from file"""
        operations = []
        pattern = r'^operation\s+([A-Za-z_]\w*):'

        for line in content.split('\n'):
            match = re.match(pattern, line.strip())
            if match:
                operations.append(match.group(1))

        return operations

    def _extract_dependencies(self, content: str) -> List[str]:
        """Extract all IMPORT dependencies"""
        dependencies = []
        pattern = r'^IMPORT\s+["\']([^"\']+)["\']\s*$'

        for line in content.split('\n'):
            match = re.match(pattern, line.strip())
            if match:
                dependencies.append(match.group(1))

        return dependencies

    def get_package_info(self, filepath: str) -> Dict:
        """Get information about a package"""
        return self.packages.get(filepath, {})

    def list_packages(self) -> List[Dict]:
        """List all loaded packages"""
        return list(self.packages.values())

    def export_registry(self, output_file: str = "lcx_packages.json"):
        """Export package registry"""
        registry = {
            "packages": self.list_packages(),
            "total": len(self.packages)
        }

        with open(output_file, 'w') as f:
            json.dump(registry, f, indent=2)

        return f"Registry exported to {output_file}"

    def search_packages(self, search_dir: str = "strategies") -> List[Dict]:
        """Search for available packages in directory"""
        packages = []
        search_path = self.root_dir / search_dir

        if not search_path.exists():
            return packages

        for lcx_file in search_path.glob("**/*.lcx"):
            with open(lcx_file, 'r') as f:
                content = f.read()

            metadata = self._extract_metadata(content)
            operations = self._extract_operations(content)

            packages.append({
                "path": str(lcx_file.relative_to(self.root_dir)),
                "name": metadata.get('name') or lcx_file.stem,
                "description": metadata.get('description'),
                "operations": operations,
                "author": metadata.get('author')
            })

        return packages

def create_package_template(name: str, description: str, filepath: str):
    """Create a package template"""
    template = f"""# @name {name}
# @description {description}
# @version 1.0.0
# @author Community

# Your strategy/workflow goes here
# This file can be imported using: IMPORT "{Path(filepath).stem}"

operation ExampleOperation:
  endpoint: /api/example
  method: GET
  output: json
"""

    with open(filepath, 'w') as f:
        f.write(template)

    return f"Package template created: {filepath}"

if __name__ == '__main__':
    import sys

    pm = PackageManager()

    if len(sys.argv) > 1:
        if sys.argv[1] == 'search':
            packages = pm.search_packages('strategies')
            print(f"\nAvailable packages ({len(packages)}):\n")
            for pkg in packages:
                print(f"  {pkg['name']}")
                if pkg['description']:
                    print(f"    {pkg['description']}")
                print(f"    Operations: {', '.join(pkg['operations'])}")
                print()

        elif sys.argv[1] == 'info' and len(sys.argv) > 2:
            success, msg = pm.load_package(sys.argv[2])
            print(msg)
            if success:
                info = pm.get_package_info(sys.argv[2])
                print(json.dumps(info, indent=2))

        elif sys.argv[1] == 'export':
            print(pm.export_registry())

    else:
        print("Usage:")
        print("  python package_manager.py search              # List packages")
        print("  python package_manager.py info <file.lcx>     # Show package info")
        print("  python package_manager.py export              # Export registry")
