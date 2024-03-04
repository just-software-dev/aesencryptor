# AES Encryptor

This app is an example of how to apply the [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) to the project on Swift. It works with both SwiftUI and UIKit.

The realization a bit differs from the original [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) concept, but the main idea remains the same.

The project consists of modules and shared entities. Each module has 4 layers (some of them could be optional):
- **CommonLayer**. There are some extra stuff like extensions, helpers, common methods, some common entities, etc. In this realization, all strings also belong to this layer, but in huge apps, there could be other solutions.
- **ServiceLayer**. This layer can contain network services, database services, some business logic services, etc. All models for these services are also on this layer. There could be subdivisions: ServiceLayer/Services and ServiceLayer/Models.
- **ViewLayer**. Here, we have views and view models (presenters). All static models that are used by views are also here.
- **AppLayer**. This is the DI layer. It contains factories, assemblies, and other low-level stuff.
