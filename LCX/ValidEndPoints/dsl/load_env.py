#!/usr/bin/env python3
"""
Load .env file and set environment variables
Makes it easy to use authenticated LCX API calls
"""

import os
from pathlib import Path

def load_env(env_file=None):
    """
    Load environment variables from .env file

    Args:
        env_file: Path to .env file (default: ./dsl/.env)

    Returns:
        dict: Loaded environment variables
    """
    if env_file is None:
        # Look for .env in current dir or dsl/ subdirectory
        if Path('.env').exists():
            env_file = '.env'
        elif Path('dsl/.env').exists():
            env_file = 'dsl/.env'
        else:
            raise FileNotFoundError(
                "No .env file found. Create one using:\n"
                "  cp dsl/.env.example dsl/.env\n"
                "Then add your LCX API credentials."
            )

    env_file = Path(env_file)
    if not env_file.exists():
        raise FileNotFoundError(f".env file not found: {env_file}")

    # Load variables
    loaded = {}
    with open(env_file, 'r') as f:
        for line in f:
            line = line.strip()

            # Skip comments and empty lines
            if not line or line.startswith('#'):
                continue

            # Parse KEY=VALUE
            if '=' in line:
                key, value = line.split('=', 1)
                key = key.strip()
                value = value.strip()

                # Remove quotes if present
                if value.startswith('"') and value.endswith('"'):
                    value = value[1:-1]
                elif value.startswith("'") and value.endswith("'"):
                    value = value[1:-1]

                # Set environment variable
                os.environ[key] = value
                loaded[key] = value

    return loaded


def verify_auth():
    """
    Verify that API credentials are loaded

    Returns:
        bool: True if both API_KEY and API_SECRET are set

    Raises:
        ValueError: If credentials are missing
    """
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')

    if not api_key:
        raise ValueError(
            "Missing LCX_API_KEY\n"
            "Set it in .env file or environment:\n"
            "  export LCX_API_KEY='your_key'\n"
            "Or create .env file with:\n"
            "  cp dsl/.env.example dsl/.env"
        )

    if not api_secret:
        raise ValueError(
            "Missing LCX_API_SECRET\n"
            "Set it in .env file or environment:\n"
            "  export LCX_API_SECRET='your_secret'"
        )

    return True


if __name__ == "__main__":
    # Example usage
    try:
        print("[*] Loading .env file...")
        env_vars = load_env()

        print(f"[OK] Loaded {len(env_vars)} environment variables:")
        for key in sorted(env_vars.keys()):
            # Mask secrets
            if 'SECRET' in key or 'KEY' in key:
                value = env_vars[key]
                masked = value[:3] + '*' * (len(value) - 6) + value[-3:]
                print(f"  {key}={masked}")
            else:
                print(f"  {key}={env_vars[key]}")

        print("\n[*] Verifying authentication...")
        if verify_auth():
            print("[OK] API credentials are set and ready to use!")
            print("\nYou can now use authenticated endpoints:")
            print("  • GetBalance")
            print("  • GetOpenOrders")
            print("  • PlaceOrder")
            print("  • CancelOrder")
            print("  • GetAccountInfo")
            print("  ... and more!")

    except FileNotFoundError as e:
        print(f"[ERROR] {e}")
        exit(1)
    except ValueError as e:
        print(f"[ERROR] {e}")
        exit(1)
