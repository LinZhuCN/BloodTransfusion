Class BloodTransfusion.DT.V251.SEG.ORCToHIPServiceRequestDTL Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, ODS.ServiceRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='ODS.ServiceRequest' sourceDocType='2.5.1:ORC' create='new' language='objectscript' >
<assign value='source.{PlacerOrderNumber.EntityIdentifier}' property='target.Identifier.Value' action='set' />
<assign value='source.{FillerOrderNumber}' property='target.Extension.BloodTransfusionExtension.Barcode' action='set' />
<assign value='source.{PlacerOrderNumber.EntityIdentifier}' property='target.ResourceId' action='set' />
<assign value='source.{OrderControl}' property='target.Extension.OrderStatus' action='set' />
<assign value='source.{OrderStatus}' property='target.Extension.AuditStatus' action='set' />
<assign value='source.{EnteredBy().IDNumber}' property='target.Extension.AuditBy.ResourceId' action='set' />
<assign value='source.{EnteredBy().GivenName}' property='target.Extension.AuditBy.Name.Text' action='set' />
<assign value='source.{EnteredBy().IdentifierTypeCode}' property='target.Extension.AuditBy.Name.Prefix' action='set' />
<assign value='source.{VerifiedBy().IDNumber}' property='target.Extension.CheckBy.ResourceId' action='set' />
<assign value='source.{VerifiedBy().GivenName}' property='target.Extension.CheckBy.Name.Text' action='set' />
<if condition='"" &apos;= source.{DateTimeofTransaction}' >
<true>
<assign value='$e(source.{DateTimeofTransaction.Time},1,4)_"-"_$e(source.{DateTimeofTransaction.Time},5,6)_"-"_$e(source.{DateTimeofTransaction.Time},7,8)_" "_$e(source.{DateTimeofTransaction.Time},9,10)_":"_$e(source.{DateTimeofTransaction.Time},11,12)_":"_$e(source.{DateTimeofTransaction.Time},13,14)' property='target.AuthoredOn' action='set' />
<assign value='source.{OrderingProvider().IDNumber}' property='target.Requester.Identifier.(1).Value' action='set' />
<assign value='source.{OrderingProvider().GivenName}' property='target.Requester.Name.Text' action='set' />
</true>
</if>
<assign value='source.{EnteringOrganization.Identifier}' property='target.Location.Department.Code' action='set' />
<assign value='source.{EnteringOrganization.Text}' property='target.Location.Department.Display' action='set' />
<assign value='source.{EnteringOrganization.AlternateIdentifier}' property='target.Location.Branch.Code' action='set' />
<assign value='source.{EnteringOrganization.AlternateText}' property='target.Location.Branch.Display' action='set' />
<assign value='source.{ActionBy().IDNumber}' property='target.Extension.ActionBy.Identifier.(1).Value' action='set' />
<assign value='source.{ActionBy().GivenName}' property='target.Extension.ActionBy.Name.Text' action='set' />
<assign value='"111"' property='target.Code.Code' action='set' />
<assign value='"输血"' property='target.Code.Display' action='set' />
<assign value='source.{OrderControl}' property='target.Status.Code' action='set' />
<assign value='"计划用血"' property='target.Status.Display' action='set' />
</transform>
}

}
