Class BloodTransfusion.DT.ToHL7.SEQ.MSHBuilder Extends Ens.DataTransformDTL [ DependsOn = (ODS.ServiceRequest, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.ServiceRequest' targetClass='EnsLib.HL7.Segment' targetDocType='2.5.1:MSH' create='new' language='objectscript' >
<assign value='"HIP"' property='target.{SendingApplication.NamespaceID}' action='set' />
<assign value='"WISU"' property='target.{SendingFacility.NamespaceID}' action='set' />
<assign value='$REPLACE($REPLACE($zdt($h,8,1)," ",""),":","")' property='target.{DateTimeOfMessage.Time}' action='set' />
<assign value='"OMB"' property='target.{MessageType.MessageCode}' action='set' />
<assign value='"O27"' property='target.{MessageType.TriggerEvent}' action='set' />
<assign value='"OMB_O27"' property='target.{MessageType.MessageStructure}' action='set' />
<assign value='"P"' property='target.{ProcessingID.ProcessingID}' action='set' />
<assign value='"2.5.1"' property='target.{VersionID.VersionID}' action='set' />
</transform>
}

}
