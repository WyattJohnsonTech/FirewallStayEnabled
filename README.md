# FirewallStayEnabled

This repositories serves to resolve any issues when deploying windows firewall to a domain with unknown firewall status's, applications, and ports.

The goal of this powershell script is to keep the windows firewall enabled after the firewall has been enabled by another script or technician.
Often firewalls get disabled by other departments, technicians, or vendors and we want to keep the firewalls enabled.
This feature exists in lots of other paid softwares and AV's, this is a free powershell based model to deploy over group policy.

Script Logic and Outcomes Below. Scheduled Task is for 10 PM Daily

If the firewall was originally enabled or has ever been enabled, the script will turn back on the windows firewall.

If the firewall was not originally enabled but has been enabled, the script will keep the windows firewall enabled.

If the firewall was not oringally enabled and has not been enabled by anyone, the script will log this annd will NOT enable the windows firewall.
