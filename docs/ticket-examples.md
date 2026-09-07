# Fictional Identity and Access Support Ticket Examples

These examples are fictional and use documentation-safe placeholder names, email addresses, groups, systems, and dates. They demonstrate clear identity-support ticket writing, access-control judgment, validation, escalation, and privacy-aware documentation.

Do not copy real account data, user names, email addresses, domains, tenant identifiers, audit logs, device identifiers, group names, screenshots, passwords, MFA codes, recovery codes, or tokens into this public repository.

## Example 1: New Hire Onboarding

### Ticket Summary

| Field | Value |
|---|---|
| Ticket ID | DEMO-2001 |
| Category | User onboarding |
| Priority | Medium |
| Target identity | `alex.taylor@example.invalid` |
| Worker type | Employee |
| Status | Resolved |
| Date | 2026-09-07 |

### Request

> Approved onboarding request for a new employee beginning on the scheduled start date. The user requires standard collaboration access, a managed Windows workstation, and role-based access to the approved departmental application.

### Validation Before Provisioning

```text
- Request received through the approved onboarding workflow.
- Manager, department, worker type, start date, and role were confirmed.
- Standard baseline access was requested.
- No privileged roles, local administrator rights, production access, or exception access were requested.
- Required approvals were recorded in the approved request system.
```

### Actions Taken

1. Provisioned the identity through the approved onboarding process.
2. Assigned approved baseline role-based access and required licenses.
3. Confirmed the user was enrolled in the required MFA workflow.
4. Assigned a managed Windows device through the approved asset process.
5. Confirmed endpoint management, encryption policy, endpoint protection, and Windows Update status.
6. Validated sign-in, MFA, collaboration access, and the required departmental application.
7. Documented the handoff and provided approved support-contact guidance.

### Validation

```text
- User successfully completed first sign-in.
- MFA enrollment completed successfully.
- User accessed approved email and collaboration tools.
- Required departmental application launched successfully.
- Managed device completed basic security and health checks.
- No privileged access was assigned.
- User confirmed readiness for work.
```

### Resolution Note

```text
Approved onboarding completed. Identity was provisioned through the approved workflow,
baseline role-based access and required licenses were assigned, and MFA enrollment was
validated. Managed Windows workstation was assigned and verified. User confirmed
successful sign-in and access to approved business tools. No privileged access assigned.
```

## Example 2: Access Request for a Shared Resource

### Ticket Summary

| Field | Value |
|---|---|
| Ticket ID | DEMO-2002 |
| Category | Access request |
| Priority | Medium |
| Target identity | `jordan.lee@example.invalid` |
| Resource | `Finance-Reports-ReadOnly` |
| Requested access | Read-only |
| Status | Resolved |
| Date | 2026-09-07 |

### Request

> User requested read-only access to an approved finance reporting location to complete monthly reconciliation tasks.

### Validation Before Access Change

```text
- User identity and target account were verified through the approved request process.
- Business purpose and requested read-only privilege were documented.
- Resource owner was identified.
- A role-based group already existed for read-only access.
- Resource-owner approval was recorded.
- Request did not require financial-system administration, broad export rights, or elevated privileges.
```

### Actions Taken

1. Used the approved role-based group instead of direct individual permission assignment.
2. Added the user through the approved identity-management workflow.
3. Set the required review date according to the documented project duration.
4. Confirmed the user could reach the approved resource.
5. Validated only the minimum required function and did not inspect financial records.
6. Documented the group assignment, approval, review date, and validation result.

### Validation

```text
- User accessed the approved reporting location.
- User had read-only access as requested.
- User did not receive administrator, contributor, or unrelated permissions.
- Resource owner approval and review date were recorded.
- User confirmed the required task could be completed.
```

### Resolution Note

```text
Resolved. Following resource-owner approval, assigned the approved read-only
role-based group for the documented business purpose. Confirmed the user could access
the required reporting location without receiving elevated or unrelated permissions.
Review date recorded in the approved request system.
```

## Example 3: Repeated Account Lockout After Password Change

### Ticket Summary

| Field | Value |
|---|---|
| Ticket ID | DEMO-2003 |
| Category | Account lockout |
| Priority | High |
| Target identity | `sam.rivera@example.invalid` |
| Status | Resolved |
| Date | 2026-09-07 |

### User Report

> I changed my password this morning. My account keeps locking, and I am repeatedly prompted to sign in on my laptop and phone.

### Security and Identity Validation

```text
- Requester identity was verified through the approved support process.
- User reported a same-day password change.
- Account was a standard user account with no privileged role.
- No active organization-wide identity outage was reported.
- No passwords, MFA codes, recovery codes, or tokens were requested or recorded.
```

### Evidence Collected

```text
- Lockout returned after an approved password reset/unlock action.
- User had an approved secondary email application configured with the old password.
- User also had an approved mobile mail profile requiring credential update.
- Authorized review found no evidence requiring a security-incident escalation.
```

### Actions Taken

1. Guided the user to update saved credentials in the approved secondary email application and mobile mail profile.
2. Used the approved account-reset and unlock workflow after identity verification.
3. Asked the user to complete required MFA.
4. Confirmed successful sign-in to approved email and collaboration services.
5. Monitored for repeat lockout according to local procedure.

### Validation

```text
- User signed in successfully.
- Required MFA challenge completed.
- Email and collaboration access restored.
- No repeat lockout occurred during the verification period.
- User confirmed normal access.
```

### Resolution Note

```text
Resolved. Repeated lockout was associated with outdated saved credentials after a
same-day password change. Requester identity was verified; user updated credentials in
approved secondary applications; account was reset/unlocked through the approved process;
sign-in and MFA were validated. No credentials or sensitive audit details recorded.
```

## Example 4: Lost Authenticator Device

### Ticket Summary

| Field | Value |
|---|---|
| Ticket ID | DEMO-2004 |
| Category | MFA recovery |
| Priority | High |
| Target identity | `casey.morgan@example.invalid` |
| Status | Resolved |
| Date | 2026-09-07 |

### User Report

> I replaced my phone and cannot approve my sign-in request. I need access to email before a scheduled meeting.

### Security and Identity Validation

```text
- Requester identity was verified through the organization-approved recovery process.
- Account was confirmed as a standard user account.
- User reported no unexpected sign-ins, MFA prompts, or suspected device theft.
- No MFA codes, recovery codes, passwords, or session tokens were requested.
```

### Actions Taken

1. Confirmed the user could not use an approved alternate authentication method.
2. Used the organization-approved MFA recovery and re-registration workflow.
3. Required the user to register a new approved authentication method.
4. Confirmed the user completed a successful MFA challenge with the new method.
5. Confirmed the user could access approved email and collaboration services.
6. Documented the recovery path without including authentication-method details.

### Validation

```text
- New approved MFA method registered.
- Successful MFA challenge completed.
- Email and collaboration access restored.
- User confirmed access before the scheduled meeting.
```

### Resolution Note

```text
Resolved through the approved MFA recovery workflow after requester identity verification.
User registered a new approved authentication method and completed a successful MFA
challenge. Verified access to approved services. No passwords, MFA codes, recovery codes,
tokens, or sensitive recovery details were recorded.
```

### Escalate Instead When

```text
- The requester cannot be verified.
- The lost device may be compromised or the user reports unexpected MFA prompts.
- The account is privileged, emergency, executive, shared, or otherwise high-risk.
- The recovery process requires bypassing approved MFA policy.
```

## Example 5: Offboarding With Privileged-Access Review

### Ticket Summary

| Field | Value |
|---|---|
| Ticket ID | DEMO-2005 |
| Category | User offboarding |
| Priority | High |
| Target identity | `taylor.chen@example.invalid` |
| Worker type | Contractor |
| Status | Resolved with follow-up |
| Date | 2026-09-07 |

### Request

> Approved contractor offboarding effective at the documented end-of-contract time. The request includes account deactivation, remote-access removal, device return, and review of any elevated access.

### Validation Before Offboarding

```text
- Request received through the approved HR and contractor-management workflow.
- Sponsor, worker type, exact end time, and time zone were verified.
- Asset record and assigned device information were available in the approved internal system.
- The account had an approved temporary administrator assignment requiring separate review.
- No legal hold or data-preservation requirement was listed in the approved request.
```

### Actions Taken

1. At the approved effective time, disabled the primary identity through the approved workflow.
2. Revoked active sessions according to policy.
3. Removed standard application, group, VPN, and external-collaboration access as approved.
4. Escalated the temporary administrator assignment to the privileged-access owner for independent verification and removal.
5. Confirmed device-return status in the approved asset-management system.
6. Assigned mailbox and file-retention review to the approved data owner.
7. Documented all completed and outstanding tasks without recording sensitive audit details.

### Validation

```text
- Primary account disabled at the approved effective time.
- Active sessions revoked according to policy.
- Standard access-removal actions completed.
- Privileged-access owner confirmed removal of temporary administrator assignment.
- Device return recorded in the approved asset system.
- Data-retention review assigned to the approved owner.
```

### Resolution Note

```text
Offboarding completed at the approved effective time. Primary identity was disabled and
sessions were revoked through approved processes. Standard group, application, VPN, and
external access were removed. Temporary privileged assignment was independently reviewed
and removed by the designated privileged-access owner. Device-return and data-retention
tasks were documented in the approved internal systems.
```

## Ticket-Writing Checklist

Before closing or escalating an identity-support ticket, confirm the record includes:

- Verified requester identity and target account.
- Clear user impact, business purpose, and scope.
- Request reference, approval record, or authorized workflow source.
- Exact error message and relevant time window when applicable.
- Evidence collected within the technician’s authorized scope.
- Approved actions completed in chronological order.
- Least-privilege reasoning for access assignments.
- Technical validation and user confirmation when applicable.
- Escalation owner, reference, and next action if unresolved.
- No passwords, MFA codes, recovery codes, session tokens, unnecessary audit data, or sensitive personal information.
