Class BloodTransfusion.Message.ServiceRequest Extends BloodTransfusion.Message.AbstractBusinessRequest
{

Property batchServiceRequest As ODS.BatchServiceRequest;

Property diagnoses As List of ODS.Diagnosis;

Property batchObservation As ODS.BatchObservation; 

Storage Default
{
<Data name="ServiceRequestDefaultData">
<Subscript>"ServiceRequest"</Subscript>
<Value name="1">
<Value>Patient</Value>
</Value>
<Value name="2">
<Value>Encounter</Value>
</Value>
<Value name="3">
<Value>serviceReuqest</Value>
</Value>
<Value name="4">
<Value>BatchServiceRequest</Value>
</Value>
<Value name="5">
<Value>batchServiceRequest</Value>
</Value>
<Value name="6">
<Value>Diagnoses</Value>
</Value>
<Value name="7">
<Value>Observations</Value>
</Value>
<Value name="8">
<Value>diagnoses</Value>
</Value>
<Value name="9">
<Value>dbservations</Value>
</Value>
<Value name="10">
<Value>observations</Value>
</Value>
<Value name="11">
<Value>batchObservations</Value>
</Value>
<Value name="12">
<Value>batchObservation</Value>
</Value>
</Data>
<DefaultData>ServiceRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
