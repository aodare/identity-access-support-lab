# Access Request and Approval Workflow

A structured workflow for requesting, validating, approving, granting, reviewing, and removing user access in an authorized environment.

This is a learning and portfolio document. Follow the organization’s approved identity-governance, access-control, data-classification, change-management, security, and records-retention procedures in production.

## Purpose

The goal of an access request is to give a verified user the minimum approved access needed to perform a legitimate business task for an appropriate period of time.

Access should be based on a valid authorization, intended system usage, approved role or privilege level, and documented business justification. Do not grant, extend, or change access based only on an informal message, verbal request, or assumption.

## Request Requirements

A complete request should include:

- Verified requester identity and target user identity.
- System, application, shared resource, group, role, or access package requested.
- Business purpose and expected task or responsibility.
- Requested access level: view, contribute, modify, approve, administer, or another approved role.
- Start date, end date, or review date for temporary access.
- Manager, application owner, data owner, or security approval as required.
- Data classification and whether the request involves sensitive, regulated, financial, customer, production, or privileged information.
- Whether an existing approved role, group, or access package already meets the need.
- Ticket, request, change, or identity-governance reference.

Return incomplete, unclear, duplicate, or unapproved requests for clarification rather than guessing.

## Request Lifecycle

```text
Access request submitted
|
+-- Is the requester and target user identity verified?
|   |
|   +-- No --> Do not proceed; follow approved verification and escalation process.
|   |
|   +-- Yes --> Continue.
|
+-- Is the business purpose, access level, and duration clear?
|   |
|   +-- No --> Return request for clarification.
|   |
|   +-- Yes --> Continue.
|
+-- Does an approved role, group, or access package exist?
|   |
|   +-- Yes --> Use the approved role-based option.
|   |
|   +-- No --> Identify the correct resource owner and approval path.
|
+-- Does the request involve privileged, production, sensitive, or exception access?
|   |
|   +-- Yes --> Require applicable owner, security, and change approvals.
|   |
|   +-- No --> Continue through the standard approval workflow.
|
+-- Approval received?
    |
    +-- No --> Do not grant access; notify requester of pending or denied status.
    |
    +-- Yes --> Grant minimum approved access, validate, document, and set review/removal date when required.
```

## Workflow Steps

### 1. Validate the Request

1. Confirm the request was submitted through the approved service-management, identity-governance, or access-request system.
2. Verify the requester and target user according to policy.
3. Confirm the resource, requested privilege, business purpose, and required duration.
4. Identify whether the request involves sensitive information, regulated data, financial systems, production systems, privileged administration, or external collaboration.
5. Check whether the requested access conflicts with separation-of-duties rules or existing policy.
6. Confirm the correct manager, application owner, data owner, or security approver is identified.
7. Record the request reference before making an access change.

### 2. Identify the Least-Privilege Option

Before assigning access, determine whether the need can be met through:

- An existing role-based group.
- An approved application role.
- A managed access package.
- A time-bound or project-specific group.
- A narrower folder, site, queue, team, or resource role.
- A standard-user workflow rather than administrator access.
- A separate privileged account and approved privileged-access process, when elevated work is genuinely necessary.

Avoid direct individual permissions when an approved group, role, or access package can provide the required access. Avoid granting administrator-level rights when a standard or delegated role is sufficient.

## 3. Obtain Required Approval

Use the organization’s approval matrix. Depending on the resource and risk, approval may be required from:

- The target user’s manager.
- The application or system owner.
- The data owner.
- The resource owner.
- Information security.
- Compliance, legal, finance, or records management.
- A change advisory or privileged-access authority.

Do not treat a requester, coworker, or manager as automatically authorized to approve every type of access. Verify the designated approver for the resource and requested privilege.

For privileged, production, emergency, or sensitive-data access, confirm whether separate approval, justification, session controls, time limits, access reviews, or a change record are required.

### 4. Grant Access

After approval:

1. Use the approved identity-management, directory, application, or access-governance tool.
2. Assign the approved group, role, license, access package, or resource permission.
3. Grant only the approved privilege level.
4. Apply a start date, expiration date, or review date when required.
5. Do not change unrelated group memberships or permissions.
6. Do not create shared accounts or share credentials to satisfy an individual-access request.
7. For elevated access, follow the approved privileged-access process rather than using the user’s normal account when policy requires separation.

### 5. Validate the Result

Confirm that:

- The approved user received the intended access.
- The user did not receive additional unapproved privileges.
- The access works for the required business task.
- The user can sign in with required MFA or identity controls.
- Any expiration, review, or ownership setting is correctly applied.
- The request is not blocked by synchronization, licensing, network, device-compliance, or conditional-access requirements.

When possible, validate only the minimum function needed. Do not open, copy, or inspect sensitive records merely to prove access works.

### 6. Document Completion

Update the approved request record with:

- Request ID and business justification.
- Target user and requested resource.
- Approved role, group, access package, or permission level.
- Approver name or approval reference.
- Effective date, expiration date, or review date.
- Tool or workflow used to make the assignment.
- Validation result and user confirmation where applicable.
- Remaining actions, owner, and due date.
- Any denied, modified, or partially granted portion of the request.

Do not include passwords, MFA codes, recovery codes, tokens, internal secrets, or unnecessary sensitive configuration details.

### 7. Review and Remove Access

Access should be reviewed and removed when:

- The user changes role, department, manager, location, or project.
- The business purpose ends.
- A temporary-access end date is reached.
- The user leaves the organization.
- The resource owner or periodic review identifies access that is no longer needed.
- The access was an exception, emergency assignment, or elevated privilege.

Record review decisions, removals, exceptions, and follow-up actions in the approved system.

## Common Request Types

| Request type | Typical approach | Approval considerations |
|---|---|---|
| Standard application access | Assign an approved role or group | Manager or application-owner approval as policy requires |
| Shared drive or collaboration site | Assign approved site or folder role | Resource/data-owner approval; confirm least-privilege folder or role |
| VPN or remote access | Assign approved remote-access entitlement | Manager, security, device-compliance, and training requirements may apply |
| Temporary project access | Use time-bound project group or access package | Project/resource owner; set expiration and review date |
| Production or administrator access | Use separate privileged-access workflow | System owner, security, change approval, justification, time limit, and review |
| External guest access | Use approved guest/collaboration process | Sponsor, data owner, security, expiration, and review requirements |

## Example Completion Note

```text
Access request completed through the approved workflow.

- Request ID: DEMO-2001
- Business purpose and required duration confirmed.
- Resource-owner approval recorded in the approved request system.
- Assigned approved role-based group: [fictional group name].
- No administrator or unrelated access assigned.
- Temporary access review date set for [approved date].
- User validated required access to the approved resource.
- No passwords, MFA codes, tokens, or unnecessary sensitive configuration details recorded.
```

## Escalation Triggers

Escalate through approved procedures when:

- Requester or target-user identity cannot be verified.
- The request lacks a business purpose, designated owner, approval, duration, or required data-classification context.
- The request involves administrator rights, production access, financial systems, customer data, regulated data, security tooling, or broad data export.
- The requested access conflicts with separation-of-duties controls or would create excessive privilege.
- An existing approved role does not meet the need and a new role, group, or access package is required.
- The request requires a policy exception, elevated privilege, new application role, or change outside your authorization.
- Access persists after expiration or removal should have occurred.
- The request appears suspicious, urgent without explanation, socially engineered, or inconsistent with the user’s role.

## Access Review Checklist

Before completing an access assignment, verify:

- The requester and target user were verified.
- Business purpose, role, privilege level, and duration are documented.
- The least-privilege group, role, or access package was selected.
- Required approvals were received and recorded.
- Expiration or periodic review is configured where required.
- Access was technically validated without unnecessary data exposure.
- Ticket notes record the change and validation but contain no secrets.
