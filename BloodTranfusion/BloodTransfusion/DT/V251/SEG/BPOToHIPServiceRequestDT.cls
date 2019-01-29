Class BloodTransfusion.DT.V251.SEG.BPOToHIPServiceRequestDT Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, ODS.ServiceRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='ODS.ServiceRequest' sourceDocType='2.5.1:BPO' create='existing' language='objectscript' >
<assign value='source.{BPUniversalServiceID.Identifier}' property='target.Extension.BloodTransfusionExtension.Product.Code' action='set' />
<assign value='source.{BPUniversalServiceID.Text}' property='target.Extension.BloodTransfusionExtension.Product.Display' action='set' />
<assign value='source.{BPProcessingRequirements().Identifier}' property='target.Extension.BloodTransfusionExtension.HandlingRequest.Code' action='set' />
<assign value='source.{BPProcessingRequirements().Text}' property='target.Extension.BloodTransfusionExtension.HandlingRequest.Display' action='set' />
<assign value='source.{BPAmount}' property='target.QuantityQuantity.value' action='set' />
<assign value='source.{BPUnits.Text}' property='target.QuantityQuantity.unit' action='set' />
<assign value='source.{BPInformedConsentIndicator}' property='target.ReasonCode.(1).Code' action='set' />
<assign value='source.{BPIndicationforUse().Text}' property='target.ReasonCode.(1).Display' action='set' />
<if condition='"" &apos;= source.{BPIntendedUseDateTime}' >
<true>
<assign value='$e(source.{BPIntendedUseDateTime.Time},1,4)_"-"_$e(source.{BPIntendedUseDateTime.Time},5,6)_"-"_$e(source.{BPIntendedUseDateTime.Time},7,8)_" "_$e(source.{BPIntendedUseDateTime.Time},9,10)_":"_$e(source.{BPIntendedUseDateTime.Time},11,12)_":"_$e(source.{BPIntendedUseDateTime.Time},13,14)' property='target.OccurrenceDateTime' action='set' />
</true>
</if>
<if condition='"" &apos;= source.{BPRequestedDispenseDateTime.Time}' >
<true>
<assign value='$e(source.{BPRequestedDispenseDateTime.Time},1,4)_"-"_$e(source.{BPRequestedDispenseDateTime.Time},5,6)_"-"_$e(source.{BPRequestedDispenseDateTime.Time},7,8)_" "_$e(source.{BPRequestedDispenseDateTime.Time},9,10)_":"_$e(source.{BPRequestedDispenseDateTime.Time},11,12)_":"_$e(source.{BPRequestedDispenseDateTime.Time},13,14)' property='target.Extension.BloodTransfusionExtension.RequestedDispenseTime' action='set' />
</true>
</if>
<assign value='source.{BPInformedConsentIndicator}' property='target.Intent.Code' action='set' />
</transform>
}

}
