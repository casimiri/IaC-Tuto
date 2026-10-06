# AWS Application Infrastructure Request

## 1. Business Context

The Application Team is developing a new **Customer Portal** and requires a cloud environment to support development and integration testing.

The Application Team is responsible for developing and maintaining the application.

The Infrastructure Team is responsible for designing, provisioning, securing, and maintaining the underlying AWS infrastructure.

The Application Team must not manually provision or modify AWS infrastructure.

---

## 2. Business Requirement

The Application Team requires a **DEV environment on AWS** where the Customer Portal can be deployed and tested.

The environment must:

- Be available to the development team within one business day after approval.
- Support hosting of the web application.
- Allow the application to be accessed over HTTPS.
- Provide secure storage for application files.
- Provide appropriate network isolation.
- Allow controlled outbound connectivity where required.
- Be reproducible if the environment needs to be recreated.
- Support future infrastructure changes without manual AWS provisioning.

---

## 3. Application Team Request

| Information | Requirement |
|---|---|
| Application | Customer Portal |
| Environment | DEV |
| Purpose | Development and integration testing |
| Application type | Web application |
| Users | Internal development and testing teams |
| Internet access | Required |
| Protocol | HTTPS |
| Application hosting | Required |
| Persistent file storage | Required |
| Database | Not required for initial release |
| High availability | Not required for DEV |
| Backup | Basic protection required for persistent data |
| Monitoring | Basic infrastructure monitoring required |
| Required delivery | Within one business day after approval |

The Application Team specifies the **business and application capabilities required**.

The Infrastructure Team determines the appropriate AWS services and architecture.

---

## 4. Infrastructure Team Responsibilities

The Infrastructure Team shall:

1. Review and clarify the infrastructure request.
2. Translate application requirements into an appropriate AWS architecture.
3. Assess security, networking, operational, and cost implications.
4. Define the infrastructure using Terraform.
5. Store infrastructure source code in GitHub.
6. Validate infrastructure changes automatically.
7. Generate an infrastructure change plan before deployment.
8. Review and approve infrastructure changes.
9. Provision approved infrastructure in AWS.
10. Maintain centralized Terraform state.
11. Maintain traceability of infrastructure changes.
12. Provide the resulting environment information to the Application Team.

---

## 5. Infrastructure Delivery Requirements

### IR-01 — Infrastructure as Code

All AWS infrastructure within the scope of the application environment must be defined using Terraform.

Manual creation of application infrastructure through the AWS Console is not permitted.

### IR-02 — Source Control

Terraform configuration must be maintained in GitHub.

Every infrastructure change must be associated with a version-controlled change.

### IR-03 — Change Management

Infrastructure changes must be performed through a controlled Git workflow.

Changes must be submitted through a Pull Request before they can be applied to the AWS environment.

### IR-04 — Automated Validation

Infrastructure changes must automatically undergo appropriate checks before deployment, including:

- Terraform formatting validation
- Terraform configuration validation
- Terraform initialization
- Terraform plan generation

A failed validation must prevent the change from progressing to deployment.

### IR-05 — Change Preview

The Infrastructure Team must be able to review the expected infrastructure changes before they are applied.

Terraform Plan must clearly identify resources that will be:

- Created
- Modified
- Replaced
- Destroyed

### IR-06 — Approval

Infrastructure changes must require review and approval before they are applied to AWS.

### IR-07 — Automated Provisioning

Following approval, the infrastructure must be provisioned through the automated Terraform workflow.

Routine infrastructure provisioning must not require manual resource creation in AWS.

### IR-08 — Terraform State

Terraform state must be centrally managed.

Terraform state files must not be committed to the GitHub repository.

### IR-09 — AWS Authentication

Infrastructure automation must use temporary or federated AWS credentials.

Long-lived AWS access keys must not be stored in:

- GitHub source code
- Terraform configuration
- GitHub Actions workflow files

### IR-10 — Network Security

The application environment must use appropriate network segmentation and security controls.

Only explicitly required inbound and outbound network traffic should be permitted.

### IR-11 — Auditability

The Infrastructure Team must be able to determine:

- Who requested an infrastructure change
- What code was changed
- Who reviewed the change
- What infrastructure changes were planned
- Who approved the deployment
- Whether the deployment succeeded or failed
- When the change was deployed

### IR-12 — Repeatability

The environment must be reproducible from the Terraform source code and associated configuration.

Re-running Terraform against an unchanged environment should not introduce unexpected infrastructure changes.

---

## 6. Request and Delivery Process

The expected process is:

```text
Application Team
       |
       | Infrastructure Request
       v
GitHub Issue
       |
       v
Infrastructure Team
       |
       | Requirements analysis
       | Architecture
       | Security / Cost assessment
       v
Terraform Code
       |
       v
GitHub Pull Request
       |
       v
GitHub Actions
       |
       | fmt
       | validate
       | automated checks
       v
HCP Terraform
       |
       | Plan
       | State
       | Approval
       | Apply
       v
AWS
       |
       v
DEV Environment
       |
       v
Application Team
```

---

## 7. Technology Constraints

The Infrastructure Team will implement the solution using:

| Capability | Technology |
|---|---|
| Source control | GitHub |
| Infrastructure request | GitHub Issues |
| CI automation | GitHub Actions |
| Infrastructure as Code | Terraform |
| Terraform execution and state | HCP Terraform |
| Cloud platform | AWS |
| AWS authentication | Federated / temporary credentials |

The business requirement remains independent of these technologies; they represent the Infrastructure Team's selected implementation.

---

## 8. Success Criteria

The implementation will be considered successful when:

1. The Application Team can submit an infrastructure request without requiring AWS administration knowledge.
2. The Infrastructure Team can translate the request into Terraform configuration.
3. All infrastructure code is maintained in GitHub.
4. Pull Requests automatically trigger infrastructure validation.
5. Terraform Plan is available before infrastructure changes are applied.
6. Failed validation prevents deployment.
7. Infrastructure changes require appropriate approval.
8. HCP Terraform centrally manages Terraform execution and state.
9. AWS authentication does not depend on long-lived credentials stored in GitHub.
10. The DEV environment can be provisioned within **30 minutes after approval**.
11. No in-scope AWS resource needs to be manually created through the AWS Console.
12. Infrastructure changes are traceable from the original request through deployment.
13. Running Terraform against an unchanged environment produces no unexpected changes.

---

## 9. End-to-End Acceptance Test

The initial DEV environment must first be successfully provisioned.

After delivery, the Application Team will submit a second request:

> **The Customer Portal requires additional application capacity and an additional storage location for generated reports.**

The Infrastructure Team must process this request through the established workflow:

```text
New Application Team Request
          |
          v
GitHub Issue
          |
          v
Infrastructure Team Analysis
          |
          v
Terraform Change
          |
          v
Feature Branch
          |
          v
Pull Request
          |
          v
GitHub Actions Validation
          |
          v
HCP Terraform Plan
          |
          v
Review / Approval
          |
          v
Terraform Apply
          |
          v
AWS Updated
          |
          v
Request Closed
```

The acceptance test passes when the requested change is deployed successfully to AWS, is fully traceable to the original request, and no infrastructure resource has been manually created or modified through the AWS Console.

---

## 10. Learning Objective

By completing this requirement, the Infrastructure Team should be able to:

> **Design and implement a secure, automated, and auditable infrastructure delivery process that converts an Application Team business requirement into AWS infrastructure using GitHub, GitHub Actions, HCP Terraform, Terraform, and AWS.**