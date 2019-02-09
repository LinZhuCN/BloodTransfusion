Class BloodTransfusion.DT.ToHL7.SEQ.ServiceRequestToORC Extends Ens.DataTransformDTL [ DependsOn = (ODS.ServiceRequest, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.ServiceRequest' targetClass='EnsLib.HL7.Segment' targetDocType='2.5.1:ORC' create='new' language='objectscript' >
<assign value='source.ResourceId' property='target.{PlacerOrderNumber.EntityIdentifier}' action='set' />
<assign value='source.Extension.BloodTransfusionExtension.Barcode' property='target.{FillerOrderNumber}' action='set' />
<assign value='source.Extension.OrderStatus' property='target.{OrderStatus}' action='set' />
<assign value='$REPLACE($REPLACE($REPLACE(source.AuthoredOn,"-","")," ",""),":","")' property='target.{DateTimeofTransaction.Time}' action='set' />
<assign value='source.Requester.Identifier.(1).Value' property='target.{OrderingProvider().IDNumber}' action='set' />
<assign value='source.Requester.Name.Text' property='target.{OrderingProvider().GivenName}' action='set' />
<assign value='source.Location.Department.Code' property='target.{EnteringOrganization.Identifier}' action='set' />
<assign value='source.Location.Department.Display' property='target.{EnteringOrganization.Text}' action='set' />
<assign value='source.Location.Branch.Code' property='target.{EnteringOrganization.AlternateIdentifier}' action='set' />
<assign value='source.Location.Branch.Display' property='target.{EnteringOrganization.AlternateText}' action='set' />
<assign value='source.Extension.ActionBy.Identifier.(1).Value' property='target.{ActionBy().IDNumber}' action='set' />
<assign value='source.Extension.ActionBy.Name.Text' property='target.{ActionBy().GivenName}' action='set' />
</transform>
}

}
