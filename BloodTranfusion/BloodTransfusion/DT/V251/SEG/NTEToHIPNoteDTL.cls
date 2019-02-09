Class BloodTransfusion.DT.V251.SEG.NTEToHIPNoteDTL Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, ODS.ServiceRequest.Note) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='ODS.ServiceRequest.Note' sourceDocType='2.5.1:NTE' create='new' language='objectscript' >
<assign value='source.{SetIDNTE}' property='target.Seq' action='set' />
<assign value='source.{CommentType.Identifier}' property='target.Comment.Code' action='set' />
<assign value='source.{CommentType.Text}' property='target.Comment.Display' action='set' />
<assign value='source.{CommentType.NameofCodingSystem}' property='target.Comment.System' action='set' />
</transform>
}

}
