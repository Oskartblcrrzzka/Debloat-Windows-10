#   Description:
# This script redirects telemetry related domains to your nowhere using the
# hosts file. Additionally telemetry is disallows via Group Policies.

Import-Module -DisableNameChecking $PSScriptRoot\..\lib\reg-helper.psm1

echo "Adding telemetry routes to hosts file"
$hosts = @"
0.0.0.0 134.170.30.202
0.0.0.0 137.116.81.24
0.0.0.0 204.79.197.200
0.0.0.0 23.218.212.69
0.0.0.0 23.218.212.69
0.0.0.0 65.39.117.230
0.0.0.0 65.55.108.23
0.0.0.0 a-0001.a-msedge.net
0.0.0.0 choice.microsoft.com
0.0.0.0 choice.microsoft.com.nsatc.net
0.0.0.0 compatexchange.cloudapp.net
0.0.0.0 corp.sts.microsoft.com
0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com
0.0.0.0 cs1.wpc.v0cdn.net
0.0.0.0 df.telemetry.microsoft.com
0.0.0.0 diagnostics.support.microsoft.com
0.0.0.0 fe2.update.microsoft.com.akadns.net
0.0.0.0 feedback.microsoft-hohm.com
0.0.0.0 feedback.search.microsoft.com
0.0.0.0 feedback.windows.com
0.0.0.0 i1.services.social.microsoft.com
0.0.0.0 i1.services.social.microsoft.com.nsatc.net
0.0.0.0 oca.telemetry.microsoft.com
0.0.0.0 oca.telemetry.microsoft.com.nsatc.net
0.0.0.0 pre.footprintpredict.com
0.0.0.0 redir.metaservices.microsoft.com
0.0.0.0 reports.wes.df.telemetry.microsoft.com
0.0.0.0 services.wes.df.telemetry.microsoft.com
0.0.0.0 settings-sandbox.data.microsoft.com
0.0.0.0 sls.update.microsoft.com.akadns.net
0.0.0.0 sqm.df.telemetry.microsoft.com
0.0.0.0 sqm.telemetry.microsoft.com
0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net
0.0.0.0 statsfe1.ws.microsoft.com
0.0.0.0 statsfe2.update.microsoft.com.akadns.net
0.0.0.0 statsfe2.ws.microsoft.com
0.0.0.0 survey.watson.microsoft.com
0.0.0.0 telecommand.telemetry.microsoft.com
0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net
0.0.0.0 telemetry.appex.bing.net
0.0.0.0 telemetry.appex.bing.net:443
0.0.0.0 telemetry.microsoft.com
0.0.0.0 telemetry.urs.microsoft.com
0.0.0.0 vortex-sandbox.data.microsoft.com
0.0.0.0 vortex-win.data.microsoft.com
0.0.0.0 vortex.data.microsoft.com
0.0.0.0 watson.live.com
0.0.0.0 watson.microsoft.com
0.0.0.0 watson.ppe.telemetry.microsoft.com
0.0.0.0 watson.telemetry.microsoft.com
0.0.0.0 watson.telemetry.microsoft.com.nsatc.net
0.0.0.0 wes.df.telemetry.microsoft.com
"@)
echo $hosts >> "$env:systemroot\System32\drivers\etc\hosts"

echo "Disabling telemetry via Group Policies"
Import-Registry(@"
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection]
"AllowTelemetry"=dword:00000000
"@)
