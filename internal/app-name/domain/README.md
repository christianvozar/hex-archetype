# Domain

A domain refers to the core business logic and the associated data models that represent the essential concepts and rules of a given application or system. The domain is the central part of the service's architecture and should be independent of any external systems, infrastructure, or user interfaces.

Domain-driven design (DDD) is a common approach used to build the domain, focusing on modeling the real-world problem and the system's behavior in a clean and maintainable way. In hexagonal architecture, the domain is encapsulated and isolated from other concerns, such as data persistence or user interface, allowing it to evolve independently and be easily tested.

## Domain Model

A domain model represents the core business concepts, rules, and logic of the application. It is a part of the domain layer, which is responsible for encapsulating the essential business knowledge and behavior. Domain models are created by identifying the key entities, value objects, and relationships within the problem domain that the application is meant to address.

A domain model typically consists of:

Entities: These are objects with a unique identity and a lifecycle. They represent the main concepts of the business domain, such as a user, product, or order. Entities usually have attributes, relationships with other entities, and methods that encapsulate business logic.

Value Objects: These are objects that represent a specific value or set of values within the domain but do not have a unique identity. They are immutable and can be freely replaced by other instances with the same values. Examples of value objects can be an email address, money, or a date range.

Aggregates: These are clusters of domain objects (entities and value objects) that are treated as a single unit. They help to maintain consistency and enforce business rules within the domain. An aggregate is typically composed of one or more entities, and it has a root entity, which acts as the entry point for external interactions.

Domain Events: These are events that represent something of importance happening within the domain, such as a user registration or an order being placed. Domain events can be used to decouple different parts of the system, enabling them to evolve independently.

Domain Services: These are components that encapsulate business logic that doesn't naturally fit within a specific domain object. They usually represent operations that involve multiple domain objects or require collaboration between them.

The domain model is kept isolated from the application's infrastructure, such as databases or external APIs, by using interfaces and dependency inversion. This ensures that the domain model remains focused on the core business concerns and is decoupled from any specific technical implementation.

## Domain Repository

A Domain Repository is an interface that abstracts the persistence mechanism for domain objects (entities or aggregates). The repository provides a clear separation between the domain layer and the infrastructure layer, allowing the domain to remain focused on business logic while the infrastructure layer handles data storage and retrieval.

Domain Repositories are responsible for performing CRUD (Create, Read, Update, Delete) operations on domain objects and retrieving objects based on specific criteria. By defining repository interfaces within the domain layer, you can implement different persistence mechanisms (e.g., relational databases, NoSQL databases, file storage, etc.) in the infrastructure layer without affecting the domain layer.

### Example

```
package domain

type User struct {
    ID        int64
    FirstName string
    LastName  string
    Email     string
}

type UserRepository interface {
    FindByID(id int64) (*User, error)
    FindByEmail(email string) (*User, error)
    Save(user *User) error
    Update(user *User) error
    Delete(id int64) error
}
```

In this example, we define a User struct as a domain object and a UserRepository interface with common methods for persisting and retrieving User objects. The actual implementation of these methods would be done in the infrastructure layer, using a specific persistence mechanism (e.g., SQL database, document store, etc.).

## Domain Service

A Domain Service is a component within the domain layer that encapsulates business logic that does not naturally fit within a specific domain object, such as an entity or value object. Domain Services are used when a certain operation requires collaboration between multiple domain objects, or when the operation is not a natural responsibility of a single domain object.

Domain Services differ from Application Services in that they focus purely on the core business logic and rules, whereas Application Services coordinate activities between different parts of the application, such as the domain layer and infrastructure layer.

In a Hexagonal Architecture, the domain layer should be isolated from external dependencies, such as databases or external services, to maintain a separation of concerns. This allows the domain layer to be more easily tested and modified, as it is not directly coupled with the infrastructure layer.

### Example

```
package domain

type ProductService struct {
    productRepository ProductRepository
}

func NewProductService(productRepository ProductRepository) *ProductService {
    return &ProductService{
        productRepository: productRepository,
    }
}

func (ps *ProductService) CalculateDiscountedPrice(productID string, discountRate float64) (float64, error) {
    product, err := ps.productRepository.FindByID(productID)
    if err != nil {
        return 0, err
    }

    if discountRate < 0 || discountRate > 1 {
        return 0, fmt.Errorf("Invalid discount rate")
    }

    discountedPrice := product.Price * (1 - discountRate)
    return discountedPrice, nil
}
```

In this example, the ProductService is a Domain Service that calculates the discounted price of a product. The service uses a ProductRepository to fetch the product details and applies the discount rate to the product price. This operation does not naturally fit within a single domain object, as it involves both a product and a discount rate, and is therefore encapsulated within a Domain Service.
