# Password Reset and Account Lockout Playbook

A structured workflow for password-reset requests, account lockouts, repeated sign-in failures, and multifactor-authentication recovery in an authorized support environment.

This is a learning and portfolio document. Follow the organization’s approved identity-verification, account-recovery, MFA, password, audit, security, and escalation procedures in production.

## Core Security Rules

- Verify the requester’s identity through the approved process before discussing, resetting, unlocking, or changing an account.
- Never ask a user to send a password, MFA approval code, recovery code, backup code, session token, or authentication prompt through email, chat, text, or ticket comments.
- Never bypass MFA, disable identity-protection controls, or weaken a password policy simply to close a support ticket.
- Use self-service password reset or approved identity-management tooling when available.
- Treat unexpected repeated lockouts, unfamiliar sign-in activity, privileged accounts, and MFA changes as potentially security-relevant.
- Record only the minimum necessary information in ticket notes. Do not include secrets, recovery information, detailed audit logs, or sensitive sign-in data.

## Initial Triage

Before taking action, collect only approved information:

1. Verify the user’s identity using the organization’s approved method.
2. Record the exact user-visible error message and approximate time of failure.
3. Identify the affected service: Windows sign-in, email, VPN, collaboration, web application, mobile device, or another approved application.
4. Determine whether the issue is a forgotten password, lockout, expired password, failed MFA prompt, lost authenticator, or repeated credential prompt.
5. Ask whether the user recently changed their password, changed phones, added a new device, traveled, or updated an application.
6. Check for known outages or maintenance affecting the identity platform.
7. Determine whether the account is standard, privileged, shared, emergency, service-related, or otherwise high-risk.
8. Escalate immediately if identity verification fails or the issue suggests compromise.

## Decision Guide

```text
User cannot sign in
|
+-- Can the user be verified through the approved process?
|   |
|   +-- No --> Do not reset or unlock the account. Escalate.
|   |
|   +-- Yes --> Continue.
|
+-- Is there a known identity-service outage?
|   |
|   +-- Yes --> Communicate status and follow incident procedures.
|   |
|   +-- No --> Continue.
|
+-- Is the password forgotten, expired, or rejected?
|   |
|   +-- Yes --> Use approved self-service or administrator reset process.
|   |
|   +-- No --> Continue.
|
+-- Is the account locked or repeatedly locking?
|   |
|   +-- Yes --> Investigate approved audit evidence and stored credentials.
|   |
|   +-- No --> Continue.
|
+-- Is MFA unavailable or failing?
    |
    +-- Yes --> Follow approved MFA-recovery process and identity verification.
    |
    +-- No --> Escalate application-specific, device, network, or identity issues as appropriate.
```

## Playbook: Password Reset

### Use When

- The user forgot their password.
- The password is expired or rejected.
- The user has a verified need to establish a new password through the approved process.
- Self-service password reset is available and appropriate.

### Steps

1. Verify the requester’s identity using the approved support procedure.
2. Confirm the account identifier through approved records.
3. Check whether the organization supports self-service password reset and guide the user to use it when appropriate.
4. If an administrator reset is authorized, use only the approved identity-management tool and workflow.
5. Require a password change at next sign-in if policy requires it.
6. Confirm the user can complete required MFA or passwordless verification.
7. Ask the user to update stale credentials in approved applications and devices after a password change.
8. Confirm successful sign-in to the affected service.
9. Document the request, identity-verification outcome, approved action, and user validation without recording any secret.

### Do Not

- Ask the user to reveal the old or new password.
- Set a password chosen by the user through unapproved communication.
- Send a temporary password in plain text through an unapproved channel.
- Reset a password for an unverified requester.
- Reset another person’s account solely because someone claims to be their manager or coworker.
- Disable MFA or conditional-access controls to make sign-in easier.

## Playbook: Account Lockout

### Symptoms

- The user receives an account-locked message.
- The account becomes locked shortly after a password reset.
- Multiple applications repeatedly prompt for credentials.
- The user reports sign-in attempts they did not initiate.

### Likely Causes

- Too many unsuccessful password attempts.
- An old password saved in an email client, mobile device, browser, VPN client, mapped drive, scheduled task, or other approved application.
- Password change not updated across all approved devices.
- Incorrect username format or an outdated account.
- A misconfigured integration, script, service, or application.
- Brute-force, password-spray, or other suspicious sign-in activity.

### Evidence to Collect

Collect and review only information you are authorized to access:

- Exact error message and time of the most recent lockout.
- Account type and privilege level.
- Whether the user recently changed their password.
- Affected devices, applications, VPN clients, email clients, browser sessions, and mobile devices.
- Approved sign-in or security audit information, including time range and source context when permitted.
- Whether lockouts continue after the user updates saved credentials.
- Whether other users are affected.

Do not copy sensitive sign-in logs, IP addresses, device IDs, session details, or tokens into public documentation or ordinary ticket comments unless approved policy allows it.

### Steps

1. Verify the requester’s identity.
2. Determine whether the lockout is isolated or part of a known identity-service issue.
3. Identify recent password changes, old saved credentials, new devices, mobile applications, VPN clients, and mapped resources.
4. If authorized, review approved audit information for repeated failed attempts and suspicious patterns.
5. Direct the user to update stored credentials on approved devices and applications.
6. Use approved self-service or administrator reset/unlock procedures when authorized.
7. Have the user complete required MFA and confirm successful access.
8. Monitor or recheck according to policy if the account had repeated lockouts.
9. Escalate unexplained, recurring, suspicious, or privileged-account lockouts.

### Example Safe Ticket Note

```text
Requester identity verified through the approved process.

User reported repeated account lockout after a same-day password change.
Reviewed approved account context and identified an outdated saved credential
in an authorized secondary email client. User updated the stored credential,
then completed the approved password-reset/unlock process and MFA verification.

User successfully signed in to approved email and collaboration services.
No passwords, recovery codes, MFA codes, or sensitive audit details were recorded.
```

## Playbook: MFA or Authenticator Recovery

### Use When

- The user replaced, lost, reset, or cannot access their registered phone or authenticator.
- MFA prompts are not arriving.
- The user cannot complete a required passwordless or MFA challenge.
- The user is blocked after a device change.

### Steps

1. Verify the requester’s identity using the organization’s approved recovery process.
2. Determine whether the issue affects one application, all identity-protected services, or only one registered method.
3. Confirm whether the user has an approved alternate authentication method.
4. Use the approved MFA-recovery, re-registration, temporary-access, or help desk workflow.
5. Require the user to register a new approved MFA or passwordless method when required.
6. Confirm the user can sign in using the newly validated method.
7. Remove outdated or lost authentication methods only through authorized tooling and approved policy.
8. Document the recovery workflow used without recording codes, secrets, device identifiers, or recovery details.

### Escalate When

- The requester cannot be verified.
- The account is privileged, emergency, shared, executive, or otherwise high-risk.
- MFA recovery requires bypassing normal policy or using a sensitive temporary-access process.
- The user reports a lost device with possible account compromise.
- The user receives unexpected MFA prompts or reports sign-ins they did not initiate.
- A conditional-access, authentication-method, federation, or identity-platform error persists.

## Security Escalation Triggers

Escalate immediately through approved security or incident-response procedures when:

- The requester cannot complete identity verification.
- The user reports unfamiliar sign-ins, MFA prompts, password-reset notifications, devices, locations, or account changes.
- The account is privileged or has production, financial, security, or broad data access.
- Repeated lockouts continue after approved credential updates.
- Audit evidence suggests password spray, brute-force attempts, token misuse, or account compromise.
- A request asks you to bypass MFA, disable protection controls, share recovery information, or ignore required approvals.
- There is a suspected phishing, social-engineering, or impersonation attempt.

## Closure Checklist

Before resolving a password or lockout ticket, confirm:

- The requester’s identity was verified through the approved process.
- The correct approved recovery, reset, unlock, or MFA workflow was used.
- The user successfully signed in and completed required authentication.
- Old credentials were updated on relevant approved applications and devices where applicable.
- Repeated or suspicious lockouts were monitored or escalated appropriately.
- The ticket contains a clear action history and validation result.
- No passwords, MFA codes, recovery codes, tokens, detailed sensitive logs, or unnecessary personal data are recorded.
