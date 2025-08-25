# xmpp-interop-tests-drone-plugin

A Drone plugin that performs XMPP interoperability tests on an XMPP domain. 

For more information, please visit our project website at https://xmpp-interop-testing.github.io/

## Basic Configuration

```yaml
- step:
    type: Plugin
    name: Run Drone plugin against XMPP server
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
        DOMAIN: example.org
        HOST: xmppserver
        ADMINACCOUNTUSERNAME: admin
        ADMINACCOUNTPASSWORD: admin
        ENABLEDSPECIFICATIONS: XEP-0115,XEP-0199,XEP-0352
```
