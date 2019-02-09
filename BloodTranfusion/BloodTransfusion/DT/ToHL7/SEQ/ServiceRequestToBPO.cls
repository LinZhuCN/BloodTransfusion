Class BloodTransfusion.DT.ToHL7.SEQ.ServiceRequestToBPO Extends Ens.DataTransformDTL [ DependsOn = (ODS.ServiceRequest, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.ServiceRequest' targetClass='EnsLib.HL7.Segment' targetDocType='2.5.1:BPO' create='new' language='objectscript' >
<assign value='source.Extension.BloodTransfusionExtension.Product.Code' property='target.{BPUniversalServiceID.Identifier}' action='set' />
<assign value='source.Extension.BloodTransfusionExtension.Product.Display' property='target.{BPUniversalServiceID.Text}' action='set' />
<assign value='source.Extension.BloodTransfusionExtension.HandlingRequest.Code' property='target.{BPProcessingRequirements().Identifier}' action='set' />
<assign value='source.Extension.BloodTransfusionExtension.HandlingRequest.Display' property='target.{BPProcessingRequirements().Text}' action='set' />
<assign value='source.QuantityQuantity.value' property='target.{BPAmount}' action='set' />
<assign value='source.QuantityQuantity.unit' property='target.{BPUnits.Text}' action='set' />
<assign value='source.ReasonCode.(1).Code' property='target.{BPInformedConsentIndicator}' action='set' />
<assign value='source.ReasonCode.(1).Display' property='target.{BPIndicationforUse().Text}' action='set' />
<assign value='$REPLACE($REPLACE($REPLACE(source.OccurrenceDateTime,"-","")," ",""),":","")' property='target.{BPIntendedUseDateTime.Time}' action='set' />
<assign value='$REPLACE($REPLACE($REPLACE(source.Extension.BloodTransfusionExtension.RequestedDispenseTime,"-","")," ",""),":","")' property='target.{BPRequestedDispenseDateTime.Time}' action='set' />
<assign value='source.Intent.Code' property='target.{BPInformedConsentIndicator}' action='set' />
</transform>
}

}
