Class HIP.Message.HIPRESTResponse Extends Ens.Response
{

Property Code As %String(MAXLEN = 8);

Property Event As %String(MAXLEN = 16);

Property ResourceId As %String;

Property Type As %String;

Property Message As %String(MAXLEN = 4096);

	/// Current Status of the instance, to be used as a shotcut for event handling
Property Status As %String;

Property Payload As %Stream.GlobalCharacter;



Storage Default
{
<Data name="HIPRESTResponseDefaultData">
<Subscript>"HIPRESTResponse"</Subscript>
<Value name="1">
<Value>Code</Value>
</Value>
<Value name="2">
<Value>Event</Value>
</Value>
<Value name="3">
<Value>ResourceId</Value>
</Value>
<Value name="4">
<Value>Type</Value>
</Value>
<Value name="5">
<Value>Message</Value>
</Value>
<Value name="6">
<Value>Payload</Value>
</Value>
<Value name="7">
<Value>Status</Value>
</Value>
</Data>
<DefaultData>HIPRESTResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
