
<#
Goal of this script is to modify a dynamic group for all users in the organization and exclude any service accounts or system mailboxes
Change identity to the group you wish to modify
Change the recipient type to match the type of mailbox you want to include in the group
This is modified to remove any mailboxes that are not assigned to a department
#>

Set-DynamicDistributionGroup -Identity "YOUR GROUP HERE REMOVE QUOTATIONS" -RecipientFilter @"
(
    (RecipientType -eq 'UserMailbox') -and
    (-not(RecipientTypeDetailsValue -eq 'SharedMailbox')) -and
    (-not(Name -like 'SystemMailbox{*')) -and
    (-not(RecipientTypeDetailsValue -eq 'MailboxPlan')) -and
    (-not(RecipientTypeDetailsValue -eq 'DiscoveryMailbox')) -and
    (-not(RecipientTypeDetailsValue -eq 'PublicFolderMailbox')) -and
    (-not(RecipientTypeDetailsValue -eq 'ArbitrationMailbox')) -and
    (-not(RecipientTypeDetailsValue -eq 'AuditLogMailbox')) -and
    (-not(RecipientTypeDetailsValue -eq 'AuxAuditLogMailbox')) -and
    (-not(RecipientTypeDetailsValue -eq 'SupervisoryReviewPolicyMailbox')) -and
    (-not(RecipientTypeDetailsValue -eq 'GuestMailUser')) -and
    (-not(Department -eq $null)) -and
    (-not(Department -eq ''))
)
"@