Class BloodTransfusion.BO.RESTToHIPOperation Extends EnsLib.REST.Operation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method SendBloodTransfusionOrder(pInput As HIP.Message.CreateServiceRequest, Output pOutput As HIP.Message.HIPTransactionResponse) As %Status
{
	try {
		
		// Execute the call
	  set tURL = ..Adapter.URL
	  
	  set tStream = ""
	  do ##class(%ZEN.Auxiliary.jsonProvider).%WriteJSONStreamFromObject(.tStream,pInput,,,,"aeloqtw")
	  set reqStr = tStream.Read()
	  
	  w reqStr
	  
      Set tSC= ..Adapter.PostURL(tURL,.tHttpResponse, , reqStr)
	  // Return the response
      If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
      }
      Quit:$$$ISERR(tSC)
      If $IsObject(tHttpResponse) {
         // Instantiate the response object
         set pOutput = ##class(HIP.Message.HIPTransactionResponse).%New()
         // Convert JSON into a Proxy Cache Object
         set tSC = ..JSONStreamToObject(tHttpResponse.Data, .pOutput)
       }
   	}catch{
       Set tSC=$$$SystemError
   }
   Quit tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="HIP.Message.HIP.Message.ServiceRequest">
        <Method>SendBloodTransfusionOrder</Method>
    </MapItem>
</MapItems>
}

}
