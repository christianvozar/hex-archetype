# Hexagonal Architecture (6AS) Service Template for Go

Archetype for Hexagonal Architecture Service (6AS)

Hexagonal architecture, also known as the Ports and Adapters pattern, is a software architectural pattern that promotes a clear separation of concerns by organizing the application into three main layers: the domain, the application, and the infrastructure. The central idea is to make the domain layer, which contains the business logic, independent of external systems or interfaces. To achieve this, hexagonal architecture uses ports to define the inputs and outputs of the system and adapters to handle the communication between the application and external elements. By isolating the core business logic from external dependencies, hexagonal architecture enables a more maintainable, testable, and scalable system.

# Disadvantages of Hexogonal Architecture Principles

While hexagonal architecture offers numerous benefits for software development, it is not a one-size-fits-all solution. It is a very complex architecture pattern that may be considered over-engineering for small projects. The abstractions used in hexogonal architecture focus on creating a clean separation of concerns and allow easy migrations to new types of interfaces for databases, message queues, and other external systems. This would inherently lead to inefficient resource allocation and result in suboptimal use of resources. Usage of the hexogonal architecture principles values velocity over performance. Hexogonal architecture principles are not great for solutions requiring tight coupling between components for instance embedded systes or application with very strict real-time constraints.
