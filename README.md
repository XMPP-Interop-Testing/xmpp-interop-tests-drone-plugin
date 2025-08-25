# xmpp-interop-tests-drone-plugin

A Drone plugin that performs XMPP interoperability tests on an XMPP domain. 

This plugin can be used in several different CI environments, including:

- [Drone](https://www.drone.io/)
- [Harness](https://www.harness.io/)
- [Woodpecker](https://woodpecker-ci.org/)

Note that most CI environments have a distinct way to configure this plugin.

For more information, please visit our project website at https://xmpp-interop-testing.github.io/

## Test Account Provisioning

The plugin will typically execute various tests. Each test will use a fresh set of XMPP user accounts. These are
automatically provisioned by the testing framework. They will be removed after the test execution.

The following strategies for test account provisioning are supported:

- By default, the test accounts are provisioned using XMPP's "In-band Registration" functionality (as defined in
  [XEP-0077](https://xmpp.org/extensions/xep-0077.html)).
- Alternatively, test accounts can be provisioned using XMPP 'Ad-hoc commands', as specified in
  [XEP-0133: Service Administration](https://xmpp.org/extensions/xep-0133.html). To enable this way of provisioning, the
  plugin's configuration must include the optional `adminAccountUsername` and `adminAccountPassword` inputs (as
  documented below).

## Inputs
The plugin can be configured using the following settings:
- `host`: IP address or DNS name of the XMPP service to run the tests on. Default value: `127.0.0.1`
- `domain`: the XMPP domain name of server under test. Default value: `example.org`
- `timeout`: the amount of milliseconds after which an XMPP action (typically an IQ request) is considered timed out. Default value: `5000` (five seconds)
- `adminAccountUsername`: _(optional)_ The account name of a pre-existing user that is allowed to create other users, per [XEP-0133](https://xmpp.org/extensions/xep-0133.html). If not provided, in-band registration ([XEP-0077](https://xmpp.org/extensions/xep-0077.html)) will be used to provision accounts.
- `adminAccountPassword`: _(optional)_ The password of the admin account.
- `disabledTests`: _(optional)_ A comma-separated list of tests that are to be skipped. For example: `EntityCapsTest,SoftwareInfoIntegrationTest`
- `disabledSpecifications`: _(optional)_ A comma-separated list of specifications (not case-sensitive) that are to be skipped. For example: `XEP-0045,XEP-0060`
- `enabledTests`: _(optional)_ A comma-separated list of tests that are the only ones to be run. For example: `EntityCapsTest,SoftwareInfoIntegrationTest`
- `enabledSpecifications`: _(optional)_ A comma-separated list of specifications (not case-sensitive) that are the only ones to be run. For example: `XEP-0045,XEP-0060`
- `logDir`: _(optional)_ The directory in which the test output and logs are to be stored. This directory will be created, if it does not already exist. Default value: `./output`

## Basic Configuration (for Drone)

```yaml
- step:
    name: Run XMPP Interop Framework tests against XMPP server
    image: ghcr.io/xmpp-interop-testing/drone-xmpp-test:latest
    settings:
      host: xmppserver
      domain: example.org
      adminAccountUsername: admin
      adminAccountPassword: admin
      enabledSpecifications: XEP-0115,XEP-0199,XEP-0352
```

## Basic Configuration (for Harness)

```yaml
- step:
    type: Plugin
    name: Run XMPP Interop Framework tests against XMPP server
    identifier: Run_Drone_plugin_against_XMPP_server
    description: Executes the Drone Plugin against the XMPP server that has been created earlier in this Pipeline
    spec:
      connectorRef: GitHub_Container_Registry
      image: ghcr.io/xmpp-interop-testing/drone-xmpp-test:latest
      reports:
        type: JUnit
        spec:
          paths:
            - "**/*.xml"
      settings:
        host: xmppserver
        domain: example.org
        adminAccountUsername: admin
        adminAccountPassword: admin
        enabledSpecifications: XEP-0115,XEP-0199,XEP-0352
```

## Basic Configuration (for Woodpecker)
```yaml
- step:
    name: Run XMPP Interop Framework tests against XMPP server
    image: ghcr.io/xmpp-interop-testing/drone-xmpp-test:latest
    settings:
      host: xmppserver
      domain: example.org
      adminAccountUsername: admin
      adminAccountPassword: admin
      enabledSpecifications: XEP-0115,XEP-0199,XEP-0352
```

## Usage Example

It is expected that this plugin is used in a continuous integration flow that creates a new build of the XMPP server
that is to be the subject of the tests.

Very generically, the xmpp-interop-tests-drone-plugin is expected to be part of such a flow in this manner:

1. Compile and build server software
2. Start server
3. **Invoke xmpp-interop-tests-drone-plugin**

The way how that's done can differ per CI environment that uses this plugin. Please find more detailed examples in the
documentation page that's provided on our website:

- [Testing in Drone](https://xmpp-interop-testing.github.io/documentation/drone)
- [Testing in Harness](https://xmpp-interop-testing.github.io/documentation/harness)
- [Testing in Woodpecker](https://xmpp-interop-testing.github.io/documentation/woodpecker)
