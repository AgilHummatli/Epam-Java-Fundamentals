# ☕ EPAM Java Fundamentals — Full Course Solutions

> *"If you already know the basics, this is where Java gets serious."*

My solutions for the **[Fundamentals] Java, CEE #19** course by EPAM — a facilitated 195-hour program across 17 modules covering everything from OOP design principles to Spring Security. Completed alongside a full-time job as a backend developer intern. Most modules scored 98–100%.

---

## 📋 Course Overview

| Module | Topic | Hours | Grade |
|--------|-------|-------|-------|
| 01 | Object-Oriented Programming & Design Principles | 19h | 99% |
| 02 | Design Patterns | 24h | 100% |
| 03 | Data Formats (XML, JSON, YAML) | 19h | 100% |
| 04 | Build Tools (Maven, Gradle) | 6h | 100% |
| 05 | Unit Testing (JUnit, Mockito) | 19h | 97% |
| 06 | Clean Code | 12h | 100% |
| 07 | Java Multithreading | 14h | 94% |
| 08 | Spring Core (IoC, DI) | 12h | 100% |
| 09 | Spring Boot | 7h | 100% |
| 10 | Spring AOP | 5h | 100% |
| 11 | Relational Databases & SQL | 4h | 100% |
| 12 | JDBC | 3h | 100% |
| 13 | Java Persistence (JPA, Spring Data) | 19h | 100% |
| 14 | Web Development (Servlets) | 4h | 100% |
| 15 | Spring MVC | 10h | 100% |
| 16 | REST API (OpenAPI, Swagger) | 8h | 100% |
| 17 | Spring Security | 7h | 100% |

---

## 🗂️ Repository Structure

```
├── aop/        # Spring AOP — aspects, pointcuts, advice (Food Delivery)
├── clean/      # Clean Code — refactoring, naming, functions
├── conc/       # Concurrent collections — ConcurrentHashMap, CopyOnWriteArrayList
├── deli/       # Food Delivery — core domain model across multiple modules
├── hang/       # Hangman — clean code refactor task
├── login/      # Login — unit testing with JUnit 5 & Mockito
├── max/        # Design Patterns — task implementation
├── mvc/        # Spring MVC — Travel booking application
├── new/        # Design Patterns — task implementation
├── sms/        # SMS Encoder — unit testing task
├── spam/       # Multithreading — spam sender with thread control
├── spring/     # Spring Core & Spring Boot — Alarm & Food Delivery
├── thread/     # Java Multithreading — thread lifecycle, pools, synchronizers
└── todo/       # REST API — To-Do app with OpenAPI/Swagger docs
```

---

## 📚 What I Learned

### Module 01 — OOP & Design Principles
SOLID in practice, not just as definitions. The Zoo and Food Delivery tasks forced real design decisions — when to use interfaces vs abstract classes, how inheritance hierarchies break under poorly applied OCP, and why Liskov violations are subtle and dangerous.

### Module 02 — Design Patterns
Creational (Factory, Builder, Singleton), Structural (Adapter, Decorator, Facade), Behavioral (Strategy, Observer, Command). The Book and Smart Home tasks required choosing patterns based on actual design constraints, not just applying them for the sake of it.

### Module 03 — Data Formats
JAXB for XML marshalling/unmarshalling, Jackson for JSON serialization. Understanding why JSON won the client-server war (human-readable, lightweight) and where XML still holds (config files, SOAP services). YAML for framework configuration.

### Module 04 — Build Tools
Maven's lifecycle phases, dependency scopes (`compile`, `test`, `provided`), transitive dependencies, and the POM inheritance model. Migrated the Food Delivery project to a proper Maven structure with test execution and packaging.

### Module 05 — Unit Testing
JUnit 5 annotations, parameterized tests, lifecycle hooks. Mockito for stubbing and verifying interactions. The key insight: tests are a design tool — hard-to-test code is a smell, not a testing problem.

### Module 06 — Clean Code
Meaningful naming, small focused functions, avoiding comments that lie. The Hangman refactor task made the cost of unclear code tangible — comprehension time, not just execution time, is what matters in a team.

### Module 07 — Java Multithreading
Thread lifecycle, `synchronized`, `volatile`, `ReentrantLock`. Thread pools with `ExecutorService`. Concurrent collections (`ConcurrentHashMap`, `CopyOnWriteArrayList`). Advanced synchronizers: `CountDownLatch`, `CyclicBarrier`, `Semaphore`. The parallel programming section was the hardest — race conditions don't reproduce consistently.

### Module 08 — Spring Core
IoC container internals, bean scopes (`singleton`, `prototype`), dependency injection via constructor vs setter vs field. Application events, `@Configuration` vs XML config. The Alarm and Food Delivery tasks wired real multi-bean applications together.

### Module 09 — Spring Boot
Auto-configuration magic demystified — how `@SpringBootApplication` combines component scan, configuration, and auto-config. Starter dependencies, embedded Tomcat, `application.properties` vs `application.yml` profiles.

### Module 10 — Spring AOP
Aspects, join points, pointcuts, advice types (`@Before`, `@After`, `@Around`). Used to add cross-cutting logging and timing to the Food Delivery service without touching business logic. Clean separation of concerns at the framework level.

### Module 11 — Relational Databases
SQL fundamentals: DDL, DML, joins, subqueries, aggregate functions, indexes. Understanding normalization and when to denormalize. Set up PostgreSQL locally and used DBeaver as a client.

### Module 12 — JDBC
Raw JDBC API: `Connection`, `PreparedStatement`, `ResultSet`. Connection pooling rationale. Understanding what JPA abstracts away — and why knowing the layer beneath matters.

### Module 13 — Java Persistence (JPA + Spring Data)
JPA entity mapping, relationship annotations (`@OneToMany`, `@ManyToMany`), cascade types, fetch strategies (`EAGER` vs `LAZY`). JPQL vs native queries. Spring Data repositories — derived query methods, `@Query`, pagination. The Food Delivery persistence task tied the full ORM stack together.

### Module 14 — Web Development
Servlet lifecycle (`init`, `service`, `destroy`), `HttpServletRequest`/`HttpServletResponse`, session management, filters and filter chains. The foundation that Spring MVC is built on.

### Module 15 — Spring MVC
`DispatcherServlet` request flow, `@Controller` vs `@RestController`, model binding, form validation with `@Valid`, Thymeleaf view resolution, exception handling with `@ControllerAdvice`. Built the Travel booking application end-to-end.

### Module 16 — REST API
REST constraints, HTTP method semantics, status code design, versioning strategies. OpenAPI 3.0 specification, Swagger UI for documentation. Built a To-Do REST API with full CRUD and documented endpoints.

### Module 17 — Spring Security
Authentication vs authorization, `SecurityFilterChain` configuration, role-based access control, password encoding with `BCrypt`, CSRF protection, stateless JWT-based security. Secured the Food Delivery application.

---

## 🛠️ Tech Stack

![Java](https://img.shields.io/badge/Java-17-orange)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-6DB33F?logo=springboot)
![Maven](https://img.shields.io/badge/Maven-C71A36?logo=apachemaven)
![JUnit](https://img.shields.io/badge/JUnit_5-25A162?logo=junit5)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql)

---

## 💡 Things That Actually Stuck

**Spring's DI container is a design enforcer.** When wiring beans together is effortless, it's because the code is already well-structured. When it fights you, the design is the problem.

**Multithreading bugs are probabilistic.** Code that looks thread-safe often isn't. The only reliable approach is understanding the Java memory model, not trusting local tests.

**JPA's `LAZY` loading is the default and the trap.** Fetching related entities outside a transaction causes `LazyInitializationException`. Understanding session scope prevents hours of debugging.

**Unit tests are a design mirror.** If mocking a class requires 10 lines of setup, the class has too many responsibilities. Tests reveal coupling that code review misses.

**AOP separates the what from the how.** Logging, timing, and security should not live inside business methods. Spring AOP makes that separation real, not theoretical.

---

## 📊 Stats

| | |
|---|---|
| Total hours | ~195 |
| Platform | EPAM Learn with Autocode automated testing |
| Coding tasks | 20+ individual tasks |
| Modules | 17 |
| Quiz average | ~97% |
| Format | Facilitated cohort (CEE #19) with mentoring sessions |
