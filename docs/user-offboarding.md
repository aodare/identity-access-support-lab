# User Offboarding Workflow

A structured workflow for removing or changing access when an employee, contractor, vendor, or approved external user leaves an organization or changes role.

This is a learning and portfolio document. In a production environment, follow the organization’s approved HR, legal, identity, security, records-retention, endpoint-management, asset-management, and incident-response procedures.

## Purpose

The goal of offboarding is to remove or appropriately change access at the approved time, protect organizational data and systems, preserve required records, recover assigned assets, and document completion.

Do not disable, delete, alter, or transfer an account based on an informal request. Confirm the authorized source, timing, scope, and approvals first.

## Required Intake Information

Before beginning, confirm the approved offboarding or role-change request includes:

- User’s approved identity or unique account identifier.
- Worker type: employee, contractor, intern, vendor, guest, or other approved category.
- Manager, HR, sponsor, or authorized requestor.
- Last working date and exact effective time, including time zone.
- Reason category, such as resignation, termination, end of contract, transfer, or role change.
- Whether the departure is routine, urgent, or security-sensitive.
- Required data-retention, mailbox, file-ownership, legal-hold, and records-management instructions.
- Assigned devices, access cards, tokens, keys, phones, and other assets.
- Applications, privileged roles, shared accounts, group access, VPN access, and external collaboration access that require review.
- Required approvals and any special legal, HR, or security instructions.

If the request is incomplete, conflicting, or does not follow the approved process, escalate rather than guessing.

## Offboarding Workflow

### 1. Validate the Request and Timing

1. Confirm the request came from the approved HR, identity-governance, manager, or service-management workflow.
2. Verify the requester is authorized to request offboarding.
3. Confirm the exact effective date, time, and time zone.
4. Determine whether the event is routine, urgent, or security-sensitive.
5. Confirm legal hold, retention, investigation, or data-preservation requirements before deleting or transferring data.
6. Identify any privileged, shared, emergency, service, or administrator accounts associated with the user.
7. Record the ticket, HR reference, change record, or incident reference.

### 2. Coordinate With Required Stakeholders

Coordinate according to policy with the relevant teams or owners:

- Human resources and the user’s manager.
- Identity and access management.
- Security or incident response for urgent or suspicious departures.
- Application, data, mailbox, and shared-resource owners.
- Endpoint management and asset management.
- Facilities or physical-security teams.
- Legal, records-management, or compliance teams when required.

Do not assume that disabling one directory account completes offboarding across every application, device, external service, or physical-access system.

### 3. Restrict or Disable Access

At the approved effective time, use the organization’s approved tooling and procedures to:

1. Block or disable the user’s primary account.
2. Revoke active sessions, refresh tokens, or remembered sign-ins when authorized.
3. Remove or suspend access to required applications, groups, access packages, licenses, VPN, and remote-access services.
4. Review and remove delegated access, mailbox permissions, shared-drive permissions, external collaboration access, and application-specific roles as approved.
5. Review elevated or privileged access separately and prioritize prompt removal under the approved privileged-access process.
6. Disable or remove organization-managed devices from the user’s active access scope when appropriate.
7. Preserve required records, mailbox contents, files, and logs according to approved retention and legal requirements.

Do not delete an account, mailbox, files, or audit data until retention, transfer, recovery, and legal requirements have been confirmed.

### 4. Review Privileged and Non-Person Accounts

Check for access that may not be visible in a basic user-account record:

- Directory or cloud administrative roles.
- Local administrator membership.
- Privileged-access-management assignments.
- Application-owner, billing, finance, security, database, or production roles.
- Shared mailboxes, shared accounts, service accounts, API keys, certificates, automation credentials, or emergency accounts associated with the user.
- External guest accounts, partner access, and third-party SaaS access.
- Device-management, remote-support, VPN, and remote-desktop access.
- Physical-access badges, hardware tokens, keys, and secure areas.

Escalate immediately if an account may retain privileged access, shared credentials, production access, or access to sensitive data after the effective offboarding time.

### 5. Recover and Secure Assets

1. Coordinate return of organization-owned laptops, phones, monitors, access cards, hardware tokens, keys, and other assigned equipment.
2. Confirm returned devices are processed through approved asset-management and endpoint-security procedures.
3. Record asset-return status and serial or asset identifiers only in the approved internal system.
4. Preserve evidence and avoid wiping, reassigning, or reimaging devices when a legal hold, investigation, or security incident applies.
5. Escalate missing equipment, suspected data loss, or unreturned privileged tokens through the approved process.

### 6. Handle Data and Ownership

Follow approved business, legal, and records-retention policies for:

- Transfer of mailbox, file, calendar, shared-folder, application, and collaboration ownership.
- Automatic replies or contact routing, when approved.
- Preservation of business records and legal-hold content.
- Removal of personal or unauthorized data through approved procedures.
- Access to the former user’s data only by authorized managers, data owners, HR, legal, or security personnel.

Do not access, copy, forward, or delete a departing user’s data without authorization and a documented business or legal reason.

### 7. Validate Completion

Confirm through approved administrative tools and records that:

- Primary account access is blocked or disabled as scheduled.
- Active sessions and refresh tokens were revoked when required.
- Privileged access was reviewed and removed or transferred.
- Required application, group, VPN, and external-access changes are complete.
- Devices and physical assets are returned, secured, or escalated.
- Data-retention and ownership-transfer tasks have an assigned owner and status.
- Required stakeholders received completion or escalation updates.

Remember that token/session revocation and application synchronization can take time. Follow the organization’s documented verification window and escalate if access remains active unexpectedly.

### 8. Document Completion

Update the approved offboarding record with:

- Request reference and effective time.
- Identity, group, application, license, VPN, and privileged-access actions completed.
- Session-revocation status when applicable.
- Asset-return status and assigned owner for outstanding assets.
- Data-retention, mailbox, file-transfer, legal-hold, or records-management actions.
- Validation performed and any known synchronization delay.
- Open tasks, escalation owners, and due dates.
- Confirmation that no passwords, tokens, recovery codes, or unnecessary sensitive data were recorded in standard ticket notes.

## Example Completion Note

```text
Approved offboarding completed at the scheduled effective time.

- Primary identity disabled through the approved identity workflow.
- Active sessions revoked according to policy.
- Standard group, application, VPN, and external collaboration access reviewed and removed as approved.
- Privileged access review completed; no remaining privileged assignments identified.
- Device and access-card return status recorded in the approved asset system.
- Mailbox and file-retention tasks assigned to the approved data owner.
- No passwords, tokens, recovery codes, or sensitive audit content recorded in ticket notes.
- Outstanding task: [approved owner] to complete [approved records or asset action] by [approved date].
```

## Urgent or Security-Sensitive Offboarding

Treat the request as urgent and escalate immediately when it involves:

- Suspected account compromise, data exfiltration, fraud, harassment, insider threat, or policy violation.
- Involuntary termination or another event with elevated security risk.
- A user with administrator, production, financial, security, or broad data-access privileges.
- Missing hardware tokens, access cards, keys, or managed devices.
- Evidence that active sessions, tokens, or access remain available after the approved revocation action.
- A legal hold, investigation, regulatory requirement, or preservation request.
- A request to bypass normal approvals or retain access beyond an authorized end date.

For urgent cases, follow the organization’s security-incident and HR procedures. Do not independently investigate, delete evidence, or disclose sensitive details beyond authorized stakeholders.

## Security Checklist

Before closing the request, confirm:

- The offboarding source, effective time, and approvals were verified.
- Account, session, application, group, VPN, and privileged-access actions were completed or assigned.
- Data-retention and legal requirements were considered before deletion or transfer.
- Devices, access badges, tokens, and other assets were returned, secured, or escalated.
- Validation was completed using approved tools and records.
- All unresolved actions have an owner, due date, and escalation path.
- Ticket notes contain no passwords, tokens, recovery codes, or unnecessary sensitive data.
