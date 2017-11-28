# Helper method for resource url
# @param String sResourcesUrl	// url of resources
# @param integer id		// id of resource
@fnUrlForResource = (sResourcesUrl, id) -> "#{sResourcesUrl}/#{id}"

# Helper method for rails resource url -- json format
# @param String baseURL	// base url of resources
# @param integer id		// id of the resource object
@fnUrlForJson = (baseURL, id) -> "#{fnUrlForResource(baseURL, id)}.json"

# Helper method for json format resources url
# @param String sResourcesUrl     // url of resources
@fnUrlForJsonArray = (sResourcesUrl) -> "#{sResourcesUrl}.json"

# Helper method for rails resource url -- pdf format
# @param String baseURL	// base url of resources
# @param integer id		// id of the resource object
@fnUrlForPdf = (baseURL, id) -> "#{fnUrlForResource(baseURL, id)}.pdf"

# Helper method for resource edit url
# @param String sResourcesURL	// url of resources
# @param integer id		// id of resource
@fnUrlForEdit = (sResourcesURL, id) -> "#{sResourcesURL}/#{id}/edit"

# Helper method for create showing link
# @param String sShowUrl	// url for resource showing
@fnLinkToShow = (sShowUrl) ->
  "<a href=\"#{sShowUrl}\" class=\"btn btn-info\">
  <span class=\"glyphicon glyphicon-info-sign\"></span>
  </a>"

@fnLinkToReview = (sShowUrl) ->
  "<a href=\"#{sShowUrl}\" class=\"btn btn-info\">
  <span class=\"glyphicon glyphicon-question-sign\"></span>
  </a>"

# Helper method for create pdf link
# @param String sShowUrl	// url for resource showing
@fnLinkToPdf = (sShowUrl, sLabel="") ->
  "<a href=\"#{sShowUrl}\" class=\"btn btn-info\">
  <span class=\"glyphicon glyphicon-print\"></span> #{sLabel}
  </a>"

# Helper method for create editing link
# @param String sEditUrl	// url for resource editing
@fnLinkToEdit = (sEditUrl, bRemote = false) ->
  if bRemote
    "<a title='Edit' href=\"#{sEditUrl}\" data-remote=\"true\"
    class=\"btn btn-primary\"><span class=\"glyphicon glyphicon-edit\"></span>
    </a>"
  else
    "<a title='Edit' href=\"#{sEditUrl}\" class=\"btn btn-primary\">
    <span class=\"glyphicon glyphicon-edit\"></span></a>"

# Helper method for create destroyint link
# @param String sDestroyUrl	// url for resource destroying
@fnLinkToDestroy = (sDestroyUrl, bRemote = false, sLabel = "Delete") ->
  if bRemote
    "<a title='#{sLabel}' href=\"#{sDestroyUrl}\"
     data-confirm=\"Are you sure?\" data-method=\"delete\"
      data-remote=\"true\" class=\"btn btn-danger\">
      <span class=\"glyphicon glyphicon-remove\"></span>
      </a>"
  else
    "<a title='#{sLabel}' href=\"#{sDestroyUrl}\" data-confirm=\"Are you sure?\"
     data-method=\"delete\" class=\"btn btn-danger\">
     <span class=\"glyphicon glyphicon-remove\"></span>
     </a>"
