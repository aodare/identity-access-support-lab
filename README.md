# Identity and Access Support Lab

A hands-on identity and access management support portfolio project focused on local account audits, group-membership review, least privilege, access workflows, account lockouts, and privacy-aware support documentation.

This repository demonstrates support practices relevant to help desk, desktop support, junior system administration, and identity-access-management roles.

## Project Goals

- Practice safe, read-only inventory of local Windows user accounts and group memberships.
- Document onboarding, offboarding, password-reset, account-lockout, and access-request workflows.
- Apply least-privilege principles and distinguish access review from permission changes.
- Demonstrate identity-verification, multifactor-authentication, audit, and escalation awareness.
- Build professional support documentation using fictional, sanitized examples only.

## Repository Structure

```text
identity-access-support-lab/
├── README.md
├── .gitignore
├── scripts/
│   ├── local-account-audit.ps1
│   └── group-membership-report.ps1
├── docs/
│   ├── user-onboarding.md
│   ├── user-offboarding.md
│   ├── password-and-lockout-playbook.md
│   ├── access-request-workflow.md
│   └── ticket-examples.md
└── sample-output/
    └── sanitized-local-account-audit.txt
```

## Scripts

### `local-account-audit.ps1`

Creates a timestamped, local, read-only report that includes:

- Local user account names and enabled status.
- Available account metadata, such as last sign-in and password-policy fields.
- Local security groups and their security identifiers.
- Membership of the built-in local Administrators group.
- Review notes emphasizing authorization, escalation, and approved change procedures.

The script does not create, delete, enable, disable, reset, unlock, or modify accounts, passwords, permissions, or memberships.

### `group-membership-report.ps1`

Creates a timestamped, local, read-only report for selected local security groups:

- Built-in Administrators group membership.
- Standard or delegated local groups such as Users and Remote Desktop Users, when present.
- Account name, object class, principal source, and security identifier for each returned member.
- A privileged-access label for the built-in Administrators group.
- Least-privilege and approval reminders.

The script identifies the built-in Administrators group through its well-known SID rather than relying on a localized display name.

## Running the Scripts

Run PowerShell as a standard user unless a task specifically requires elevated permissions. The reports may contain local account names, SIDs, group memberships, and timestamps, so do not upload generated output to public repositories.

```powershell
git clone [https://github.com/aodare/identity-access-support-lab.git](https://github.com/aodare/identity-access-support-lab.git)
cd identity-access-support-lab

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

.\scripts\local-account-audit.ps1
.\scripts\group-membership-report.ps1
```

`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` applies only to the current PowerShell session. It does not permanently change the computer’s execution-policy configuration.

Generated reports are written to the local `reports/` directory, which is excluded from Git by `.gitignore`.

## Access Review Principles

1. Verify the identity of a requester before discussing, unlocking, resetting, or changing an account.
2. Confirm that a request has appropriate approval and a legitimate business purpose.
3. Grant the minimum access needed for the approved task.
4. Use group-based access where an approved role or group exists.
5. Treat local administrator access as privileged and validate it carefully.
6. Document who requested access, who approved it, what changed, why it changed, and when access should be reviewed or removed.
7. Do not make access changes based solely on an inventory report.
8. Escalate suspected compromise, unexpected privilege, privileged-account requests, or identity-platform problems.

## Security and Privacy

- Run scripts only on systems you own or are authorized to support.
- The scripts are read-only and do not display passwords or authentication secrets.
- Do not commit generated files from `reports/`.
- Do not commit real user names, email addresses, account IDs, tenant IDs, SIDs, domains, group names, audit logs, access-control screenshots, tokens, recovery codes, credentials, or VPN details.
- Use only fictional identities such as `alex.taylor@example.invalid` in public examples.
- Verify identity through approved policy before account recovery or access changes.
- Never request passwords, MFA codes, recovery codes, or session tokens through email, chat, or ticket comments.

## Skills Demonstrated

- Windows local account and security-group auditing.
- PowerShell reporting, functions, error handling, and file output.
- Security identifier and privileged-group awareness.
- Least privilege and role-based access principles.
- Access-request validation and approval workflows.
- Account lockout and password-reset support practices.
- User onboarding and offboarding documentation.
- Identity verification, MFA protection, audit awareness, and escalation judgment.
- Privacy-aware documentation and support-ticket writing.

## Documentation

- [User onboarding workflow](docs/user-onboarding.md)
- [User offboarding workflow](docs/user-offboarding.md)
- [Password reset and account lockout playbook](docs/password-and-lockout-playbook.md)
- [Access request and approval workflow](docs/access-request-workflow.md)
- [Fictional identity-support ticket examples](docs/ticket-examples.md)
- [Sanitized local account audit sample output](sample-output/sanitized-local-account-audit.txt)

## Disclaimer

This repository is a learning and portfolio project. It is not a replacement for an organization’s approved identity governance, access-control, account-recovery, audit, change-management, security, or incident-response procedures.
