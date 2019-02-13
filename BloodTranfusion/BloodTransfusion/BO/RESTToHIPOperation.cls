Class BloodTransfusion.BO.RESTToHIPOperation Extends EnsLib.REST.Operation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method SendHIPRESTRequest(pRequest As HIP.Message.HIPRESTRequest, Output pResponse As HIP.Message.HIPRESTResponse) As %Status
{
	try {
	  // Get resouce specific url 
	  set tURL = ..Adapter.URL_"/"_pRequest.Type
	  //Invoke handlers to perform
	  set tSC = $CASE(pRequest.Operation,
		"Create":..OnCreate(tURL,pRequest,.pResponse),
		"Delete":..OnDelete(pRequest,.pResponse),
		"Update":..OnUpdate(tURL,pRequest,.pResponse),
		"Search":..OnSearch(pRequest,.pResponse),
		"Read":..OnRead(tURL,pRequest,.pResponse)) 
   	}catch{
       Set tSC=$$$SystemError
   }
   Quit tSC
}

Method OnCreate(tURL As %String, pRequest As HIP.Message.HIPRESTRequest, ByRef pResponse As HIP.Message.HIPRESTResponse) As %Status
{
	Set tSC= ..Adapter.PostURL(tURL,.tHttpResponse, , pRequest.Payload)
	  // Return the response
      /*If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
      }*/
      If ($IsObject(tHttpResponse)&&tHttpResponse.Data.Size) {
         // Instantiate the response object
         Set pResponse = ##class(HIP.Message.HIPRESTResponse).%New()
         // Convert JSON into a Proxy Cache Object 
         Set tSC = ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(tHttpResponse.Data, "HIP.Message.HIPRESTResponse",.pResponse)
       }
      Quit tSC
}

Method OnRead(tURL As %String, pRequest As HIP.Message.HIPRESTRequest, ByRef pResponse As HIP.Message.HIPRESTResponse) As %Status
{
	set callUrl = tURL_"/"_pRequest.Id
	
	Set tSC= ..Adapter.GetURL(callUrl,.tHttpResponse)
	/*If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
		 
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
    }*/
    set pResponse = ##class(HIP.Message.HIPRESTResponse).%New()
    If ($IsObject(tHttpResponse)&&tHttpResponse.Data.Size) {
         set str = tHttpResponse.Data
         do str.Rewind()
         // Convert JSON into a Proxy Cache Object
         set tSC = ##class(%ZEN.Auxiliary.jsonProvider).%ParseJSON(str.Read(),"HIP.Message.HIPRESTResponse",.pResponse)
         //set tSC = ..JSONStreamToObject(tHttpResponse.Data, .pResponse,"HIP.Message.HIPRESTResponse")
    }else{
    		set str = tHttpResponse.Data
    		set tSC = ##class(%ZEN.Auxiliary.jsonProvider).%ParseJSON(str,"HIP.Message.HIPRESTResponse",.pResponse)
    }
	Quit tSC
}

Method OnDelete(pRequest As HIP.Message.HIPRESTRequest, ByRef pResponse As HIP.Message.HIPRESTResponse) As %Status
{
	Quit $$$ERROR($$$NotImplemented)
}

Method OnUpdate(tURL As %String, pRequest As HIP.Message.HIPRESTRequest, ByRef pResponse As HIP.Message.HIPRESTResponse) As %Status
{
	set tURL = tURL _ "/" _pRequest.Id
	Set tSC= ..Adapter.PutURL(tURL,.tHttpResponse, , pRequest.Payload)
	  // Return the response
      /*If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
      }*/
      If ($IsObject(tHttpResponse)&&tHttpResponse.Data.Size) {
         // Instantiate the response object
         Set pResponse = ##class(HIP.Message.HIPRESTResponse).%New()
         // Convert JSON into a Proxy Cache Object 
         Set tSC = ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(tHttpResponse.Data, "HIP.Message.HIPRESTResponse",.pResponse)
       }
      Quit tSC
}

Method OnSearch(pRequest As HIP.Message.HIPRESTRequest, ByRef pResponse As HIP.Message.HIPRESTResponse) As %Status
{
	Quit $$$ERROR($$$NotImplemented)
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="HIP.Message.HIPRESTRequest">
        <Method>SendHIPRESTRequest</Method>
    </MapItem>
</MapItems>
}

}
