Class BloodTransfusion.DT.ToHL7.SEQ.ObservationToOBX Extends Ens.DataTransformDTL [ DependsOn = (ODS.Observation, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ODS.Observation' targetClass='EnsLib.HL7.Segment' targetDocType='2.5.1:OBX' create='new' language='objectscript' >
<assign value='source.ResourceId' property='target.{SetIDOBX}' action='set' />
<assign value='source.Code.Code' property='target.{ObservationIdentifier.Identifier}' action='set' />
<assign value='source.Code.Display' property='target.{ObservationIdentifier.Text}' action='set' />
<assign value='source.Category.Code' property='target.{ObservationIdentifier.AlternateIdentifier}' action='set' />
<assign value='source.Category.Display' property='target.{ObservationIdentifier.AlternateText}' action='set' />
<assign value='source.SubId' property='target.{ObservationSubID}' action='set' />
<assign value='source.ValueType' property='target.{ValueType}' action='set' />
<foreach property='source.Value()' key='k1' >
<assign value='source.Value.(k1)' property='target.{ObservationValue(k1)}' action='set' />
</foreach>
<assign value='source.ReferenceRange.Text' property='target.{ReferencesRange}' action='set' />
<assign value='source.Interpretation.Display' property='target.{AbnormalFlags(1)}' action='set' />
<assign value='source.Status.Code' property='target.{ObservationResultStatus}' action='set' />
<assign value='$REPLACE($REPLACE($REPLACE(source.EffectiveDateTime,"-","")," ",""),":","")' property='target.{DateTimeoftheObservation.Time}' action='set' />
<assign value='source.Specimen.Type.Code' property='target.{ResponsibleObserver().IDNumber}' action='set' />
<assign value='source.Specimen.ResultFlag' property='target.{ResponsibleObserver().GivenName}' action='set' />
<assign value='source.Specimen.LowLevel' property='target.{ResponsibleObserver().SecondandFurtherGivenNamesor}' action='set' />
<assign value='source.Specimen.HighLevel' property='target.{ResponsibleObserver().Suffix}' action='set' />
<assign value='source.ValueUnits' property='target.{Units.Text}' action='set' />
</transform>
}

}
