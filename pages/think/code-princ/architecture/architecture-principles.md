---
layout: page
location: pages/think/code-princ/architecture/leaf
permalink: /pages/think/code-princ/architecture/Architecture-Principles
---

## Neal Ford workshop

- My notes on Neal Ford's architecture workshop: OneDrive\TW-Stuff\6.Writing\Architecture Book\Neal Ford architecture workshop notes.docx
- See also 
	- the [architecture styles worksheet](https://www.developertoarchitect.com/downloads/architecture-styles-worksheet.pdf) - the table that allows you to select architectures based on which characteristics are most important to you
		- ...and the [architecture characteristics worksheet](https://www.developertoarchitect.com/downloads/architecture-characteristics-worksheet.pdf)
		- ...both of which I have downloaded at OneDrive\TW-Stuff\6.Writing\Architecture Book
	- ADRs (architecture decision records)
		- [blog post here](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
		- [Samman learning hour here](https://sammancoaching.org/learning_hours/architecture/architecture_decision_records.html)
		- Structure of an ADR:
			- Status
			- Context
			- Decision
			- Consequences
				- What gets easier
				- What gets harder
				- Risks and mitigation strategies
	- clare-tech: architectural-kata-notes.md, in particular the section on judging criteria
	- The ilitities (aka non-functional characteristics or system quality attributes): You should consider no more than 7: See [Lesson 112](https://www.developertoarchitect.com/lessons/lesson112.html) (Mark Richards)
	- ![[Screenshot 2025-11-19 at 19.21.08.jpg]]

## Residuality theory, from Barry O'Reilly

- (See also my phone notes from Chris Simon's talk at NewCrafts '25)
- (See also [this blog post](https://www.architecture-weekly.com/p/residuality-theory-a-rebellious-take))
- Consider as many stressors as you can think of - could be 200 (not 3 like in the example in Chris's talk)
	- Don't spend a lot of time on each one 
	- By having a lot of stressors we don't have to get them all right 
	- Over time you'll find the same architecture keeps emerging as handling multiple different stressors
	- 
- **Stressors** - Unexpected events that challenge your system (technical failures, market changes, regulatory shifts),    
- **Residues:** The elements of your design that survive after stressors hit,    
- **Attractors**: States that systems naturally tend toward when under stress,    
- **Incidence Matrix**: A tool to visualise relationships between stressors and components

## Things to think about for webapps

- CMS (Content Management System)
    - No hard-coded strings
    - Content changes can be made without deploying
- SPA
    - Single Page Architecture
- Progressive enhancement
    - No javascript by default
    - Not possible with client-side rendering
- Client-Side Rendering (CSR) vs Server-Side Rendering (SSR)
    - [Here](https://medium.com/@addyosmani/progressive-web-apps-with-react-js-part-4-site-is-progressively-enhanced-b5ad7cf7a447)
    - [Here](https://www.freecodecamp.org/news/what-exactly-is-client-side-rendering-and-hows-it-different-from-server-side-rendering-bd5c786b340d/)
- Route management 
	- Do your urls make sense? Will they help your users to navigate your site, and will they help you with things like Google Analytics?
- Performance 
	- Page load speed 
	- Above the fold / below the fold 

## Feature Toggles / Feature Toggling

- There is an example of this in [Samba](https://github.com/claresudbery/samba) - see the `Feature Toggles` section in the [Useful Notes doc](https://github.com/claresudbery/samba/blob/master/Useful-Notes.docx) (accessible to clare only)

## Event sourcing

"Can you tell me about event sourcing, including some simple examples?"

A pattern where you store every state change as an immutable event, then rebuild current state by replaying those events. Instead of updating records in place, you append events to a log.

### Core concepts

- **Event**: Immutable fact describing something that happened (past tense).
    - `OrderPlaced`, `ItemAddedToCart`, `PaymentProcessed`
- **Event Store**: Append-only log of all events.
- **Aggregate**: Entity whose state is derived by replaying its events.
- **Projection/Read Model**: Materialized view built from events for queries.

### Benefits

- **Complete audit trail**: Every change is recorded with timestamp and context.
- **Time travel**: Replay events to any point in time.
- **Debugging**: Reproduce bugs by replaying the exact event sequence.
- **Multiple views**: Build different projections from the same events.
- **Event-driven architecture**: Events can trigger side effects, notifications, etc.

### Trade-offs

- **Complexity**: More moving parts than CRUD.
- **Eventual consistency**: Projections may lag behind events.
- **Schema evolution**: Old events must remain compatible or be migrated.
- **Query complexity**: Need separate read models; can't easily query event store directly.

### Simple example: Bank account

```typescript

// Events (immutable facts)  
type AccountEvent =  
  | { type: 'AccountOpened'; accountId: string; initialBalance: number; timestamp: Date }  
  | { type: 'MoneyDeposited'; accountId: string; amount: number; timestamp: Date }  
  | { type: 'MoneyWithdrawn'; accountId: string; amount: number; timestamp: Date };  
  
// Aggregate (current state)  
interface Account {  
  id: string;  
  balance: number;  
  isOpen: boolean;  
}  
  
// Rebuild state by replaying events  
function replayEvents(events: AccountEvent[]): Account {  
  let account: Account = { id: '', balance: 0, isOpen: false };  
    
  for (const event of events) {  
    switch (event.type) {  
      case 'AccountOpened':  
        account = { id: event.accountId, balance: event.initialBalance, isOpen: true };  
        break;  
      case 'MoneyDeposited':  
        account.balance += event.amount;  
        break;  
      case 'MoneyWithdrawn':  
        account.balance -= event.amount;  
        break;  
    }  
  }  
    
  return account;  
}  
  
// Usage  
const events: AccountEvent[] = [  
  { type: 'AccountOpened', accountId: 'A123', initialBalance: 100, timestamp: new Date('2025-01-01') },  
  { type: 'MoneyDeposited', accountId: 'A123', amount: 50, timestamp: new Date('2025-01-02') },  
  { type: 'MoneyWithdrawn', accountId: 'A123', amount: 30, timestamp: new Date('2025-01-03') }  
];  
  
const currentState = replayEvents(events); // { id: 'A123', balance: 120, isOpen: true }  
  
// Time travel: state at 2025-01-02  
const pastEvents = events.filter(e => e.timestamp <= new Date('2025-01-02'));  
const pastState = replayEvents(pastEvents); // { id: 'A123', balance: 150, isOpen: true }
```

### Simple example: Shopping cart

```typescript

type CartEvent =  
  | { type: 'CartCreated'; cartId: string; userId: string }  
  | { type: 'ItemAdded'; cartId: string; productId: string; quantity: number }  
  | { type: 'ItemRemoved'; cartId: string; productId: string }  
  | { type: 'CartCheckedOut'; cartId: string; total: number };  
  
interface CartItem {  
  productId: string;  
  quantity: number;  
}  
  
interface Cart {  
  id: string;  
  userId: string;  
  items: CartItem[];  
  checkedOut: boolean;  
}  
  
function applyEvent(cart: Cart, event: CartEvent): Cart {  
  switch (event.type) {  
    case 'CartCreated':  
      return { id: event.cartId, userId: event.userId, items: [], checkedOut: false };  
      
    case 'ItemAdded':  
      const existing = cart.items.find(i => i.productId === event.productId);  
      if (existing) {  
        return {  
          ...cart,  
          items: cart.items.map(i =>  
            i.productId === event.productId  
              ? { ...i, quantity: i.quantity + event.quantity }  
              : i  
          )  
        };  
      }  
      return { ...cart, items: [...cart.items, { productId: event.productId, quantity: event.quantity }] };  
      
    case 'ItemRemoved':  
      return { ...cart, items: cart.items.filter(i => i.productId !== event.productId) };  
      
    case 'CartCheckedOut':  
      return { ...cart, checkedOut: true };  
      
    default:  
      return cart;  
  }  
}  
  
function buildCart(events: CartEvent[]): Cart {  
  return events.reduce(  
    (cart, event) => applyEvent(cart, event),  
    { id: '', userId: '', items: [], checkedOut: false }  
  );  
}
```
### Event store (simplified)

```typescript

class EventStore {  
  private events: Map<string, AccountEvent[]> = new Map();  
  
  append(accountId: string, event: AccountEvent): void {  
    const existing = this.events.get(accountId) || [];  
    this.events.set(accountId, [...existing, event]);  
  }  
  
  getEvents(accountId: string): AccountEvent[] {  
    return this.events.get(accountId) || [];  
  }  
  
  getCurrentState(accountId: string): Account {  
    return replayEvents(this.getEvents(accountId));  
  }  
}  
  
// Usage  
const store = new EventStore();  
store.append('A123', { type: 'AccountOpened', accountId: 'A123', initialBalance: 100, timestamp: new Date() });  
store.append('A123', { type: 'MoneyDeposited', accountId: 'A123', amount: 50, timestamp: new Date() });  
  
const account = store.getCurrentState('A123'); // { id: 'A123', balance: 150, isOpen: true }

```

### Projections (read models)

Build specialized views for queries:

```typescript

// Projection: Total deposits per account  
function buildDepositSummary(events: AccountEvent[]): Map<string, number> {  
  const summary = new Map<string, number>();  
    
  for (const event of events) {  
    if (event.type === 'MoneyDeposited') {  
      const current = summary.get(event.accountId) || 0;  
      summary.set(event.accountId, current + event.amount);  
    }  
  }  
    
  return summary;  
}
```

### When to use

- **Good fit**: Financial systems, audit-heavy domains, collaborative editing, undo/redo, compliance.
- **Poor fit**: Simple CRUD apps, performance-critical reads without caching, small teams unfamiliar with the pattern.

### Real-world tools

- **Databases**: EventStoreDB, Apache Kafka, AWS EventBridge, PostgreSQL (append-only tables)
- **Frameworks**: Axon Framework (Java), Eventuous (.NET), Akka Persistence (Scala/Java)

### Status

Let me know if you want a working example added to your TypeScript playground file or a more detailed pattern (e.g., CQRS + Event Sourcing).

## Event Storming

A collaborative workshop technique for exploring complex business domains. Participants use sticky notes on a wall to map out domain events, commands, actors, and aggregates. Invented by Alberto Brandolini.

### Core concepts

- **Domain Event** (orange): Something that happened in the domain (past tense).
    - `OrderPlaced`, `PaymentReceived`, `ItemShipped`
- **Command** (blue): Action that triggers an event.
    - `PlaceOrder`, `ProcessPayment`, `ShipItem`
- **Actor/User** (yellow): Person or system that issues commands.
    - `Customer`, `Admin`, `Payment Gateway`
- **Aggregate** (pale yellow): Cluster of domain objects that enforce business rules.
    - `Order`, `Payment`, `Shipment`
- **Policy/Reaction** (lilac): Automated response to an event.
    - "When `OrderPlaced`, then `ReserveInventory`"
- **Read Model** (green): Information needed to make decisions.
    - `Product Catalog`, `Inventory Levels`
- **External System** (pink): Third-party integration.
    - `Stripe`, `Email Service`, `Warehouse System`

### Workshop format

1. **Big Picture** (2-4 hours): Map the entire business process chronologically on a long wall.
2. **Process Modeling** (1-2 hours per process): Zoom into specific flows, add commands/actors/policies.
3. **Software Design** (optional): Identify aggregates and bounded contexts for implementation.

### Benefits

- **Shared understanding**: Business and tech align on domain language.
- **Discover complexity**: Uncover edge cases, missing processes, bottlenecks.
- **Fast**: Hours instead of weeks of requirements gathering.
- **Inclusive**: Non-technical stakeholders participate equally.
- **Visual**: Spatial layout reveals dependencies and flow.

### Simple example: E-commerce order flow

#### Timeline of events (orange sticky notes, left to right)

ItemAddedToCart → CartViewed → CheckoutStarted → PaymentAuthorized   
→ OrderPlaced → InventoryReserved → OrderPacked → OrderShipped   
→ DeliveryConfirmed → OrderCompleted

#### Adding commands and actors

[Customer] --PlaceOrder--> [OrderPlaced]  
[Customer] --AddItemToCart--> [ItemAddedToCart]  
[Payment System] --AuthorizePayment--> [PaymentAuthorized]  
[Warehouse Staff] --PackOrder--> [OrderPacked]  
[Shipping Service] --ShipOrder--> [OrderShipped]

#### Adding policies (automation)

[OrderPlaced] --"Reserve inventory"--> [ReserveInventory command] --> [InventoryReserved]  
[PaymentAuthorized] --"Create order"--> [PlaceOrder command] --> [OrderPlaced]  
[OrderShipped] --"Send tracking email"--> [SendEmail command] --> [EmailSent]

#### Adding aggregates

Cart aggregate: handles [ItemAddedToCart], [ItemRemoved], [CartCleared]  
Order aggregate: handles [OrderPlaced], [OrderCancelled], [OrderCompleted]  
Inventory aggregate: handles [InventoryReserved], [InventoryReleased]

#### Adding read models

Before [PlaceOrder]: Customer needs [Cart Contents], [Product Prices], [Shipping Options]  
Before [PackOrder]: Warehouse needs [Order Details], [Inventory Location]

### Simple example: Restaurant ordering

#### Events timeline

CustomerArrived → TableAssigned → MenuViewed → OrderTaken   
→ OrderSentToKitchen → FoodPrepared → FoodServed   
→ BillRequested → PaymentReceived → TableCleared

#### With commands, actors, policies

[Host] --AssignTable--> [TableAssigned]  
[Waiter] --TakeOrder--> [OrderTaken]  
  
Policy: [OrderTaken] --"Send to kitchen"--> [SendToKitchen] --> [OrderSentToKitchen]  
  
[Chef] --MarkFoodReady--> [FoodPrepared]  
  
Policy: [FoodPrepared] --"Notify waiter"--> [NotifyWaiter] --> [WaiterNotified]  
  
[Waiter] --ServeFood--> [FoodServed]  
[Customer] --RequestBill--> [BillRequested]  
[Customer] --PayBill--> [PaymentReceived]  
  
Policy: [PaymentReceived] --"Clear table"--> [ClearTable] --> [TableCleared]

#### Aggregates

Table aggregate: [TableAssigned], [TableCleared]  
Order aggregate: [OrderTaken], [OrderSentToKitchen], [FoodServed]  
Bill aggregate: [BillRequested], [PaymentReceived]

### Practical tips

- **Start with events**: Don't overthink; just list things that happen.
- **Use past tense**: "OrderPlaced" not "PlaceOrder" (that's a command).
- **Chronological flow**: Left to right on the wall.
- **No perfect model**: Goal is shared understanding, not complete documentation.
- **Hotspots** (red): Mark areas of confusion, conflict, or missing info to revisit.
- **Timebox**: Don't get stuck; move on and circle back.
- **Facilitate neutrally**: Let domain experts drive; tech asks clarifying questions.

### Event Storming vs Event Sourcing

|Event Storming|Event Sourcing|
|---|---|
|Workshop technique|Software architecture pattern|
|Discovers domain events|Stores events as source of truth|
|Sticky notes on wall|Events in database|
|Business modeling|Technical implementation|
|Hours to days|Ongoing system design|

They complement each other: Event Storming discovers the events, Event Sourcing implements them.

### Common patterns discovered

- **Saga/Process Manager**: Long-running workflows spanning multiple aggregates.
    - Example: `OrderPlaced` → reserve inventory → charge payment → ship order
- **Bounded Contexts**: Natural boundaries where language/rules change.
    - Example: "Order" means different things in Sales vs Warehouse
- **Missing events**: Gaps in the timeline reveal undocumented processes.
- **Duplicate events**: Same event triggered by different actors reveals inconsistency.

### Example output artifacts

After the workshop, you might produce:

typescript

// Domain events discovered  
type RestaurantEvent =  
  | { type: 'TableAssigned'; tableId: string; customerId: string }  
  | { type: 'OrderTaken'; orderId: string; items: MenuItem[] }  
  | { type: 'OrderSentToKitchen'; orderId: string }  
  | { type: 'FoodPrepared'; orderId: string }  
  | { type: 'FoodServed'; orderId: string; tableId: string }  
  | { type: 'PaymentReceived'; billId: string; amount: number };  
  
// Commands discovered  
type RestaurantCommand =  
  | { type: 'AssignTable'; tableId: string; customerId: string }  
  | { type: 'TakeOrder'; orderId: string; items: MenuItem[] }  
  | { type: 'MarkFoodReady'; orderId: string }  
  | { type: 'ServeFood'; orderId: string; tableId: string };  
  
// Policies discovered  
function onOrderTaken(event: Extract<RestaurantEvent, { type: 'OrderTaken' }>): RestaurantCommand {  
  return { type: 'SendToKitchen', orderId: event.orderId };  
}

### When to use

- **Good fit**: New projects, complex domains, cross-functional teams, unclear requirements.
- **Poor fit**: Well-understood domains, solo projects, purely technical problems.

### Resources

- **Book**: "Introducing EventStorming" by Alberto Brandolini
- **Remote tools**: Miro, Mural, FigJam (use colored rectangles instead of sticky notes)
- **In-person**: Long wall, lots of sticky notes (orange, blue, yellow, lilac, green, pink), markers

### Status

Event Storming is a discovery tool; Event Sourcing is an implementation pattern. You can do one without the other, but they work well together.