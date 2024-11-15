function validateForm() {

    var isValid = Page_ClientValidate('firstForm'); // Validate the first form

    if (!isValid) {
        // If validation fails, gather error messages and display in an alert
        var errorMessage = "Please fill in the following fields:\n";
        for (var i = 0; i < Page_Validators.length; i++) {
            var validator = Page_Validators[i];
            if (!validator.isvalid) {
                errorMessage += "- " + validator.errormessage + "\n";
            }
        }
        alert(errorMessage);
    }
    console.log("i am fire")
    return isValid; // Return true if validation passes, false otherwise
}

function validateForm2() {
    var isValid = Page_ClientValidate('secondForm'); // Validate the second form
    if (!isValid) {
        var errorMessage = "Please fill in the following fields:\n";
        for (var i = 0; i < Page_Validators.length; i++) {
            var validator = Page_Validators[i];
            if (!validator.isvalid) {
                errorMessage += "- " + validator.errormessage + "\n";
            }
        }
        alert(errorMessage);
    }
    return isValid;
}

function validateForm3() {
    var isValid = Page_ClientValidate('thirdForm'); // Validate the third form
    if (!isValid) {
        var errorMessage = "Please fill in the following fields:\n";
        for (var i = 0; i < Page_Validators.length; i++) {
            var validator = Page_Validators[i];
            if (!validator.isvalid) {
                errorMessage += "- " + validator.errormessage + "\n";
            }
        }
        alert(errorMessage);
    }
    return isValid;
}

function validateForm4() {
    var isValid = Page_ClientValidate('fourthForm'); // Validate the fourth form
    if (!isValid) {
        var errorMessage = "Please fill in the following fields:\n";
        for (var i = 0; i < Page_Validators.length; i++) {
            var validator = Page_Validators[i];
            if (!validator.isvalid) {
                errorMessage += "- " + validator.errormessage + "\n";
            }
        }
        alert(errorMessage);
    }
    return isValid;
}

function validateForm5() {
    var isValid = Page_ClientValidate('sixForm'); // Validate the fifth form
    if (!isValid) {
        var errorMessage = "Please fill in the following fields:\n";
        for (var i = 0; i < Page_Validators.length; i++) {
            var validator = Page_Validators[i];
            if (!validator.isvalid) {
                errorMessage += "- " + validator.errormessage + "\n";
            }
        }
        alert(errorMessage);
    }
    return isValid;
}

function loadcont2() {

    // Initialize tooltips
    var tooltips = $("[title]").tooltip({
        show: { effect: 'slideDown' }
    });

    // Check if modal should be shown based on hidden input value
    if (document.getElementById("hdnpopupshow").value == "Yes") {

        if (validateForm()) {
            $('#myModal').modal({
                backdrop: 'static',
                keyboard: false
            });
        }
    }


    // Hide last row of GridView1 initially
    $('#GridView1 tr:last').hide();

    // Handle tooltips on focus and mouseover
    tooltips.each(function (index, value) {
        try {
            var pid = $(this).offsetParent().first().attr('id');
            $("#" + pid).tooltip({
                show: { effect: 'slideDown' }
            }).on("focus mouseover", function () {
                var tt = $("#" + pid).tooltip({
                    show: { effect: 'slideDown' }
                });

                if ($("#" + this.id).css('display') == 'none' || $("#" + this.id).css("visibility") == "hidden") {
                    $("#" + pid).prop("title", "");
                    tt.tooltip("disable");
                } else {
                    tt.tooltip("open");
                }
            });
        } catch (e) {
            console.error("Tooltip Error: ", e);
        }
    });

    // Smart Wizard Initialization
    $('#smartwizard').smartWizard({
        selected: 0, // Start at the first step
        theme: 'dots', // Theme: 'default', 'arrows', 'dots', 'progress'
        transition: {
            animation: 'slide-horizontal' // Effect on navigation: none/fade/slide-horizontal/slide-vertical/slide-swing
        },
        toolbarSettings: {
            toolbarPosition: 'bottom', // Show buttons at the bottom
            toolbarExtraButtons: [

                $('<button></button>').text('Cancel').addClass('btn btn-danger').on('click', function () {
                    $('#smartwizard').smartWizard("reset");
                }), $('<button></button>').text('Save').addClass('btn btn-primary d-none btn-form-save').on('click', function () {
                    $("#Button8").click();

                }),

            ]
        },
        anchorSettings: {
            anchorClickable: false, // Disable navigation by clicking anchors
            enableAllAnchors: false,
            markDoneStep: true,
            markAllPreviousStepsAsDone: true,
            removeDoneStepOnNavigateBack: true,
            useURLhash: false,
            showStepURLhash: false,
            enableAnchorOnDoneStep: true
        },
        options: { justified: true }
    });
    debugger;
    var formstepIndex = $('#smartwizard').smartWizard("getStepIndex");
    if (formstepIndex > 2) {
        setTimeout(() => {

            $(".sw-btn-next").addClass("d-none"); // Rename "Next" button to "Save"
            $(".btn-form-save").removeClass("d-none"); // Rename "Next" button to "Save"
        }, 500)
    }
    // Handle navigation between steps
    $('#smartwizard').on("leaveStep", function (e, anchorObject, stepIndex, nextStepIndex, stepDirection) {

        var isValid = true;
        $(".sw-btn-next").removeClass("d-none"); // Rename "Next" button to "Save"
        $(".btn-form-save").addClass("d-none"); // Rename "Next" button to "Save"

        // Always allow going back to previous steps
        if (stepDirection === 'backward') {
            return true;
        }
        // Only validate when moving forward
        if (stepDirection === 'forward') {
            switch (stepIndex) {
                case 0:
                    isValid = validateForm2();
                    if (isValid) {
                        // Trigger the Button5 click event directly
                        $("#Button5").click();
                    }
                    break;
                case 1:
                    isValid = validateForm3();
                    if (isValid) {
                        // Trigger the Button6 click event directly
                        $("#Button6").click();
                        //  document.getElementById('<%= Button6.ClientID %>').click();
                    }
                    break;
                case 2:
                    debugger;
                    isValid = validateForm4();
                    if (isValid) {
                        // Trigger the btncontinueKYC click event directly
                        $("#btncontinueKYC").click();
                        //    document.getElementById('btncontinueKYC').click();
                        setTimeout(() => {

                            $(".sw-btn-next").addClass("d-none"); // Rename "Next" button to "Save"
                            $(".btn-form-save").removeClass("d-none"); // Rename "Next" button to "Save"
                        }, 500)

                    }
                    break;
                case 3:
                    isValid = validateForm5();
                    if (isValid) {
                        // Trigger the Button8 click event directly
                        $("#Button8").click();
                        //document.getElementById('<%= Button8.ClientID %>').click();
                    }
                    break;
            }

            if (!isValid) {
                return false; // Stop navigation if validation fails
            }
        }


    });

    // Refresh wizard when Dialog button is clicked
    $("#btnDialog").on("click", function () {
        $("#smartwizard").smartWizard("currentRefresh");
        $('#myModal').modal({
            backdrop: 'static',
            keyboard: false
        });
    });
}

// Submit button click event handler
$("#btnSubmit").on("click", function () {


    $("#hdnpopupshow").val("Yes");
    loadcont2(); // Load the wizard and validate
});

// Initialize wizard and scripts on document ready
$(function () {

    // loadcont2();

});
