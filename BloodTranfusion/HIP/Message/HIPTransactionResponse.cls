Class HIP.Message.HIPTransactionResponse Extends Ens.Response
{

Property code As %String;

Property event As %String;

Property message As %String(MAXLEN = 1024);

Storage Default
{
<Data name="HIPTransactionResponseDefaultData">
<Subscript>"HIPTransactionResponse"</Subscript>
<Value name="1">
<Value>code</Value>
</Value>
<Value name="2">
<Value>event</Value>
</Value>
<Value name="3">
<Value>message</Value>
</Value>
</Data>
<DefaultData>HIPTransactionResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
