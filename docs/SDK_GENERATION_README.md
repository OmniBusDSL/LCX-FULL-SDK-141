# LCX API SDK Generation

This directory contains scripts and generated SDKs for the **LCX Exchange API** across **40+ programming languages**.

## 📊 What Was Generated

### Client SDKs (40+ languages)
```
Python, Java, Go, TypeScript, C#, PHP, Rust, Swift, Kotlin, JavaScript, Dart, Scala,
Ruby, C++, C, R, Lua, Perl, Bash, PowerShell, Haskell, Clojure, Crystal, Elixir,
Elm, Erlang, Groovy, Julia, Nim, Objective-C, OCaml, ActionScript, Ada, Apex,
Eiffel, Xojo, Node.js, + specialized variants (Google API Client, Apache HttpClient, etc.)
```

### Server Stubs (15+ frameworks)
```
Node.js (Express, Hapi, NestJS)
Python (Flask, FastAPI, Tornado, Django)
Go (Gin, Gorilla Mux, Echo, Chi)
Java (Spring Boot, JAX-RS, Helidon, Micronaut, Quarkus, Vert.x)
PHP (Symfony, Laravel, Slim, Lumen)
C# (ASP.NET Core, NancyFx)
Rust (Rocket, Actix)
Kotlin (Ktor, Spring Boot)
Ruby (Rails, Sinatra)
```

## 📁 Directory Structure

```
generated_sdks/
├── client_python/           # Python SDK
├── client_java/             # Java SDK
├── client_go/               # Go SDK
├── client_typescript/       # TypeScript SDK
├── client_csharp/           # C# SDK
├── server_nodejs_express/   # Node.js Express Server
├── server_python_fastapi/   # Python FastAPI Server
├── server_java_spring_boot/ # Java Spring Boot Server
└── ... (40+ more directories)

report.html                  # HTML Report with generation status
generators_list.txt         # List of all generators
```

## 🚀 How to Use Generated SDKs

### Python Example
```bash
cd generated_sdks/client_python
# Install the SDK
pip install -e .
# Use it
from openapi_client import ApiClient, Configuration
```

### TypeScript/JavaScript Example
```bash
cd generated_sdks/client_typescript
# Install
npm install
# Use it
import { DefaultApi } from './';
```

### Java Example
```bash
cd generated_sdks/client_java
# Build
mvn clean install
# Use in your project
import io.swagger.client.api.DefaultApi;
```

### Go Example
```bash
cd generated_sdks/client_go
# Import in your project
import "github.com/swagger-api/swagger-go-client"
```

## 🛠️ Server Stubs - Quick Start

### Node.js Express Server
```bash
cd generated_sdks/server_nodejs_express
npm install
npm start
# Server running on http://localhost:8080
```

### Python FastAPI Server
```bash
cd generated_sdks/server_python_fastapi
pip install -r requirements.txt
python -m uvicorn main:app --reload
# API documentation at http://localhost:8000/docs
```

### Java Spring Boot Server
```bash
cd generated_sdks/server_java_spring_boot
mvn clean package
java -jar target/*.jar
# Server running on http://localhost:8080
```

## 📊 What's Inside Each SDK

Each generated SDK includes:

1. **API Client Classes** - Type-safe API methods
2. **Model Classes** - Data structures matching OpenAPI spec
3. **Authentication** - Built-in HMAC-SHA256 signing for LCX API
4. **Request/Response** - Serialization/deserialization
5. **Documentation** - README and inline docs
6. **Build Configuration** - Package managers (Maven, npm, pip, cargo, etc.)
7. **Examples** - Sample code for common operations

## 🔐 Authentication

All generated SDKs include LCX authentication support:
- API key & secret management
- HMAC-SHA256 signature generation
- Automatic timestamp injection
- Header injection for all requests

**Important**: Replace placeholders with your actual LCX API credentials:
```
x-access-key: YOUR_API_KEY
x-access-sign: HMAC_SHA256_SIGNATURE
x-access-timestamp: CURRENT_TIMESTAMP_MS
```

## 🔄 Regeneration

To regenerate all SDKs (if OpenAPI spec changes):

```bash
# Option A: Using JAR
java -jar openapi-generator-cli.jar generate -i lcx_openapi.json -g python -o generated_sdks/client_python

# Option B: Using CLI (if installed globally)
openapi-generator-cli generate -i lcx_openapi.json -g java -o generated_sdks/client_java

# Option C: Run the generation script
python3 generate_all_sdks.py
```

## 📋 Generation Report

After running `generate_all_sdks.py`, check:
- **report.html** - Visual dashboard with success/failure rates
- **generation_log.txt** - Detailed logs for each generator
- Each SDK directory - For any generation errors

## 🎯 Recommended SDKs for Different Use Cases

### Most Popular / Production-Ready
- **Python** - Data science, automation, trading bots
- **TypeScript/JavaScript** - Web applications, Node.js servers
- **Java** - Enterprise applications, Spring Boot
- **Go** - Microservices, high-performance trading
- **C#** - .NET applications, Windows services

### Mobile Development
- **Swift** - iOS applications
- **Kotlin** - Android applications (modern)
- **Java** - Android applications (legacy)
- **Dart** - Flutter cross-platform apps

### Systems Programming
- **Rust** - Safe, high-performance systems
- **C++** - Hardware integration, performance-critical
- **C** - Embedded systems, low-level access

### Alternative Languages
- **Ruby** - Web frameworks (Rails, Sinatra)
- **PHP** - Web backends (Laravel, Symfony)
- **Go** - Cloud-native applications
- **Scala** - JVM polyglot applications

## 📝 Notes

- Each SDK is **independent** - copy the desired folder to your project
- Generated code follows **language conventions** and best practices
- All SDKs are **synchronous by default** (async versions available in some languages)
- WebSocket support varies by generator (check individual SDK documentation)

## 🆘 Troubleshooting

### SDK not working?
1. Check the SDK's README in its directory
2. Review `generation_log.txt` for generation errors
3. Verify OpenAPI spec is valid: `lcx_openapi.json`
4. Check language-specific dependencies are installed

### Missing authentication headers?
- Ensure x-access-key, x-access-sign, x-access-timestamp are configured
- Review Authentication section in generated SDK docs

### Port/address already in use (Server Stubs)?
- Change the port in the server configuration
- Or kill the process using the port

## 📚 Resources

- **LCX API Docs**: https://docs.lcx.com/
- **OpenAPI Generator**: https://openapi-generator.tech/
- **OpenAPI Specification**: https://spec.openapis.org/

---

**Generated**: 2026-03-21
**OpenAPI Spec Version**: lcx_openapi.json (v1.1.0)
**Generator Version**: openapi-generator-cli 7.20.0
