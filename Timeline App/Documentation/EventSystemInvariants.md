# Event System Invariants

## 1. Immutability
Events are append-only and must never be mutated after persistence.

## 2. Time Semantics
- eventTime represents semantic occurrence.
- recordedAt represents observation time.
They are distinct and must not be conflated.

## 3. Ordering
Events are totally ordered by:
1. eventTime (desc)
2. recordedAt (desc)
3. eventID (desc)

## 4. Late Events
Late-arriving events are expected and must integrate without corruption.

## 5. Derived State
All read models must be derivable from the event log.

