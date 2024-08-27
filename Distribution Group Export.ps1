<#
Grab all members of a dynamic distribution group and export to CSV to verify validation of the group
Change the group name to match the group you want to export
Change the export path to match your desired location
#>
$Everybody = Get-DynamicDistributionGroup "YOURGROUPHERE"
$members = Get-Recipient -RecipientPreviewFilter $Everybody.RecipientFilter -OrganizationalUnit $Everybody.RecipientContainer 
$members | export-csv c:\nexigen\everyone.csv