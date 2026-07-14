# Procedure Library

## Overview

The Procedure Library is the central catalogue of surgical procedures supported by the application.

Each procedure definition provides the metadata required for:

- Case logging
- Dynamic forms
- Skill tracking
- Analytics
- Portfolio generation

---

# Structure

Procedures are organised by specialty.

Example:

```text
procedures/

Adult Cardiac Surgery/
Congenital Cardiac Surgery/
Thoracic Surgery/
Congenital Thoracic Surgery/
Vascular Surgery/
MICS/
Robotic Surgery/
ICU and Bedside Procedures/
Other Procedures/
```

---

# Procedure Definition

Each procedure contains:

- Unique ID
- Display name
- Specialty
- Category
- Description
- Required fields
- Referenced lookup tables
- Associated skills
- Tags
- Metadata

---

# References

Procedures should reference lookup tables rather than storing values directly.

Examples:

- Diagnoses
- Prosthesis types
- Conduits
- Repair techniques
- Consultants

This minimizes duplication and ensures consistency.

---

# Skills

Each procedure links to one or more skills.

Skills are defined separately in:

```
seed/skills/
```

This allows:

- Skill progression
- Competency tracking
- Analytics

without duplicating skill definitions.

---

# Maintenance Guidelines

When adding a new procedure:

1. Use a unique stable ID.
2. Reuse existing references whenever possible.
3. Link appropriate skills.
4. Keep descriptions concise.
5. Update documentation if a new category is introduced.

Avoid duplicate procedures across specialties unless the operative approach is intentionally different (e.g. Open vs MICS vs Robotic).
