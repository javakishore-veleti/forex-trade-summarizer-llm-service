# FOREX Trade Summarizer with LLM
FOREX Trade Summarizer is Spring Boot, Apache Nifi, RabbitMQ, MongoDB, Java, LLM application that summarizes trade events using Java LLM libraries

## Introduction
This FOREX Trade Summarizer applications demonstrates an innovative approach to automating the generation of insightful trade summaries for FOREX trade events. 

By leveraging Large Language Models (LLMs) and a robust data pipeline, this application aims to empower traders and analysts with concise, informative summaries that can enhance decision-making and improve risk management.

## Value Proposition
In FOREX trading, timely and accurate information is crucial. The Trade Summarizer offers several key benefits:

- **Efficiency**: Automatically generate summaries of complex trade events, saving traders and analysts valuable time and effort. 
- Insights: Extract key information from trade data, highlighting important details and potential risks or opportunities. 
- **Decision Support**: Provide concise summaries that can be quickly reviewed to inform trading decisions. 
- **Risk Management**: Help identify potential risk factors by summarizing trade events in the context of market conditions. 
- **Scalability**: Handle large volumes of trade events with a scalable architecture that can adapt to your business needs.

## Technology Stack
- **LLM Provider**: Open-source LLM provider like GPT-Neo or Falcon-7B. 
- **Java**: Primary programming language for building the application components. 
- **Spring Boot**: Framework for creating robust and scalable backend services. 
- **LangChain4j**: Java library for simplifying the integration of LLMs into applications. 
- **Apache NiFi**: Visual dataflow tool for generating and processing trade events. 
- **RabbitMQ**: Message broker for reliable communication between components. 
- **MongoDB**: NoSQL database for storing trade events and summaries. 
- **Docker**: Containerization technology for consistent deployment across environments. 
- **Ansible**: Automation tool for provisioning AWS Lightsail instances and deploying Docker containers.

## Application Architecture

![Application Architecture](Docs/Designs/Application_Architecture.png)

```plantuml
Insert image here from Docs/Design/Architecture.png

```plantuml
@startuml

skinparam component {
BorderColor Black
BackgroundColor LightYellow
FontColor Black
FontSize 12
StereotypeFontColor Black
StereotypeFontSize 10
}

package "AWS Lightsail Instance 1" {
component MongoDB <<database>>
component ApacheNiFi <<data flow>>
component "Open-Source LLM" <<machine learning>>
component RabbitMQ <<message broker>>
}

package "AWS Lightsail Instance 2" {
component "Trade Event Consumer/Persister" <<Spring Boot>>
}

package "AWS Lightsail Instance 3" {
component "LLM Trade Summarizer" <<Spring Boot>> as Summarizer1
component "LLM Trade Summarizer" <<Spring Boot>> as Summarizer2
component "LLM Trade Summarizer" <<Spring Boot>> as Summarizer3
}

cloud AWS {
LoadBalancer -down- Summarizer1
LoadBalancer -down- Summarizer2
LoadBalancer -down- Summarizer3
}

ApacheNiFi "generates" -> RabbitMQ : Trade Events
RabbitMQ "routes" -> TradeEventConsumerPersister : Trade Events
TradeEventConsumerPersister "persists" -> MongoDB : Trade Data
TradeEventConsumerPersister "triggers" -> RabbitMQ : Summary Request
RabbitMQ "routes" -> LoadBalancer
LoadBalancer "balances" -> Summarizer1
LoadBalancer "balances" -> Summarizer2
LoadBalancer "balances" -> Summarizer3
Summarizer1 "uses" -down- "Open-Source LLM"
Summarizer2 "uses" -down- "Open-Source LLM"
Summarizer3 "uses" -down- "Open-Source LLM"
Summarizer1 "updates" -> MongoDB : Trade Summaries
Summarizer2 "updates" -> MongoDB : Trade Summaries
Summarizer3 "updates" -> MongoDB : Trade Summaries
@enduml

```

### The application consists of the following components:
- **Trade Event Generator (Apache NiFi)**: Creates realistic trade events based on configurable parameters and sends them to RabbitMQ. 
- **Trade Event Consumer/Persister (Spring Boot)**: Consumes trade events from RabbitMQ, persists them to MongoDB, and triggers the LLM Summarizer. 
- **LLM Trade Summarizer (Spring Boot)**: Consumes trade events, generates summaries using the LLM via LangChain4j, and updates the trade documents in MongoDB. 
- **MongoDB**: Stores raw trade events and LLM-generated summaries. 
- **RabbitMQ**: Facilitates reliable communication between the components.

## Deployment Architecture
The application is deployed on AWS Lightsail using Ansible for automation. The components are distributed across three Lightsail instances for scalability and isolation:

- **Instance 1**: MongoDB, Apache NiFi, Open-Source LLM, RabbitMQ 
- **Instance 2**: Trade Event Publisher, Trade Event Consumer/Persister 
- **Instance 3**: LLM Trade Summarizer (multiple instances for horizontal scaling)
Note: Consider using a Lightsail Load Balancer to distribute traffic to the LLM Summarizer instances.

## Data Modeling

```plantuml
@startuml

skinparam class {
    BorderColor Black
    BackgroundColor LightYellow
    FontColor Black
    FontSize 12
    AttributeFontColor Black
    AttributeFontSize 10
}

class Currency {
    - _id: ObjectId
    - code: String
    - name: String
    - symbol: String (optional)
}

class Trade {
    - _id: ObjectId
    - orderId: ObjectId
    - timestamp: Date
    - baseCurrency: ObjectId
    - quoteCurrency: ObjectId
    - price: Decimal128
    - quantity: Decimal128
    - side: String
    - status: String
    - summary: String (optional)
}

class Order {
    - _id: ObjectId
    - accountId: ObjectId
    - timestamp: Date
    - baseCurrency: ObjectId
    - quoteCurrency: ObjectId
    - orderType: String
    - price: Decimal128
    - quantity: Decimal128
}

class Tick {
    - _id: ObjectId
    - timestamp: Date
    - pair: String
    - bid: Decimal128
    - ask: Decimal128
    - volume: Decimal128 (optional)
}

class Account {
    - _id: ObjectId
    - customerId: String
    - ... (other attributes)
}

Trade "*" -- "1" Order : places >
Trade "*" -- "1" Currency : base >
Trade "*" -- "1" Currency : quote >
Order "*" -- "1" Account : belongs to >
Tick "*" -- "1" Currency : base >
Tick "*" -- "1" Currency : quote >

@enduml
```

## AWS Resources
This application leverages the following AWS services to create a scalable and reliable infrastructure for the FOREX Trade Summarizer:

### AWS Lightsail

Lightsail Instances: Three separate instances are provisioned for different components of the application:

- **Instance 1**: MongoDB, Apache NiFi, Open-Source LLM, RabbitMQ 
- **Instance 2**: Trade Event Publisher, Trade Event Consumer/Persister 
- **Instance 3**: LLM Trade Summarizer (multiple instances for horizontal scaling)
- (Optional) Lightsail Load Balancer:  For distributing traffic evenly across the LLM Summarizer instances to improve performance and resilience.

### Other Potential AWS Services (Optional)

- **Amazon ECR (Elastic Container Registry)**: A fully managed container registry to store, manage, and deploy your Docker images. 
- **Amazon SageMaker**: A fully managed service for building, training, and deploying machine learning models, including LLMs. Could be used to deploy the LLM component if you prefer a managed solution. 
- **Amazon DocumentDB** (with MongoDB compatibility): A scalable, highly available, and fully managed document database service compatible with MongoDB. Could be used instead of self-hosted MongoDB on Lightsail if you prefer a managed database solution. 
- **Amazon CloudWatch**: For monitoring the performance and health of your Lightsail instances, containers, and potentially the LLM model. 
- **AWS Secrets Manager**: A secure service for storing and retrieving secrets like API keys and database credentials. 

### Ansible for Infrastructure as Code (IaC)

The deployment and management of these AWS resources are automated using Ansible. The provided Ansible playbook (playbook.yml) defines the necessary tasks to:

- Create Lightsail instances. 
- Install Docker and Docker Compose. 
- Pull Docker images from your chosen container registry (e.g., Docker Hub or ECR). 
- Configure and start the containers on each instance.
- (Optional) Set up a Lightsail Load Balancer.

