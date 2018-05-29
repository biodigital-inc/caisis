			//
			// workflow scripts. steps in workflow pulled from CommonTasksConfig.XML file and put in js array
			//
			
			// array populated in codebehind
			var stepArray = new Array();
			
			function setFirstStep()
			{
				//check that a workflow has been selected(stepArray is defined)
				if(stepArray.length > 0)
				{
					// highlight active step
					highlightStep(0);
				
					// hide chron list if first step in workflow needs full screen
					setFullScreen(stepArray[0][2]);
				}
			}
			function goToNextStep()
			{	
					
					
					//returns 1 if saved, 
					//returns 2 if form has not been changed so no reason to save; go to next step, 
					//returns 3 if validation prevented form from being saved; remain on current step; current step should remain 
					//save current data before going to next form; 
					//v3.5 var returnVal = DataEntryFrame.SaveCurrentForm()
					//var returnVal = DataEntryFrame.form[0].submit();
					window.frames["DataEntryFrame"].disIsDirty();
					window.frames["DataEntryFrame"].document.forms[0].WorkFlowFlag.value = 'true';
					window.frames["DataEntryFrame"].document.forms[0].submit();
					
					//if(returnVal==true)//form is being saved so pause and then go to next step
					//{
					//	var stepId = getCurrentStepIndex() + 1;
						
					//	setTimeout("loadStep(" + stepId + ")", 2400); //pause to allow saving of form on next click
					//}
					//else if(returnVal==false)
					//{
					//	var stepId = getCurrentStepIndex() + 1;
					//	loadStep(stepId);
					//}
			}
			function goToPreviousStep()
			{
					var stepId = getCurrentStepIndex() - 1;
					loadStep(stepId);		
			}
			function getCurrentStepIndex()
			{
					var j = 0;
					
					var query = DataEntryFrame.location.search.substring(1);
					
					var pair  = query.split("=");
					
					for(var i=0;i<stepArray.length;i++)
					{
						var queryString = stepArray[i][0].split("=");
						
						if(queryString[1] == pair[1])
						{
							j = i; // if match is found return index of matching data entry form name, otherwise return 0 for first step
						}
					}
					
					return j;
			}
			
			function loadStep(stepId)
			{
				//look at current page name, find next page name in array, and load that page
				
				// reset button visibilities
				var formPath	= stepArray[stepId][0]; //0 position is form name
				var chronView	= stepArray[stepId][1]; //1 position is chron list view name
				var isFullScreen = stepArray[stepId][2]; //2 position is yes or no for fullScreen	
				
				//set panel to full screen of standard
				setFullScreen(isFullScreen);
				
				// load pages
				ChronListFrame.location.replace('ChronList.aspx?listType='+chronView+'');
				DataEntryFrame.location.replace(formPath);//PatientDataForm.location.replace('DataEntryContainer.aspx?dataForm='+formName+'');	
				
				// highlight active step
				highlightStep(stepId);
				
				// hide next btn if last step
				if(stepId == stepArray.length - 1)
				{
					document.getElementById('nextBtn').style.visibility = 'hidden';
				}
				// show button if not on last step and workflow step div is visible
				else
				{
					document.getElementById('nextBtn').style.visibility = 'visible';
				}	
				
				// hide previous btn if first step
				if(stepId == 0)
				{
					document.getElementById('previousBtn').style.visibility = 'hidden';
				}
				else
				{
					//if(document.getElementById('workFlowSteps').style.visibility == 'visible')
					//{
						document.getElementById('previousBtn').style.visibility = 'visible';
					//}
				}
			}
			function highlightStep(stepId)
			{
				for(var i=0;i<stepArray.length;i++)
				{
					//remove highlight from all steps
					document.getElementById(i).className = 'stepOff';
				}
				
				//highlight current step
				document.getElementById(stepId).className = 'stepOn';
			}
			// hide workflow steps if still visible from the last workflow that was used
			function resetWorkFlow(pageLoad)
			{
				// just relocate user to index page; pause briefly to allow saving of current form
				setTimeout(window.location.href = "Index.aspx", 1800);
			}
