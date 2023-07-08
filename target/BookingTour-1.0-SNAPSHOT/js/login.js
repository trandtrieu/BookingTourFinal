const form = document.getElementById("form");
const username = document.getElementById("username");
const password = document.getElementById("password");

const setError = (element, message) => {
    const inputControl = element.parentElement.parentElement;
    const errorDisplay = inputControl.querySelector(".errortext");

    errorDisplay.innerText = message;
    element.classList.add("error");
    element.classList.remove("success");
};

const setSuccess = (element, message) => {
    const inputControl = element.parentElement.parentElement;
    const errorDisplay = inputControl.querySelector(".errortext");
    console.log(inputControl);

    errorDisplay.innerText = "";
    element.classList.add("success");
    element.classList.remove("error");
};
const isValidPassword = (password) => {
    const re = /^(?!.*\s).+$/;
     return password.match(re);
};

const validateLogin = () => {
    console.log("alooo");
    const usernameValue = username.value.trim();
    const passwordValue = password.value.trim();


    let errorFlag = true;
    if (usernameValue === "") {
        setError(username, "Username is required");
        errorFlag = false;
    } else {
        setSuccess(username);
    }

    if (passwordValue === "") {
        setError(password, "Password is required");
        errorFlag = false;
    } else if (passwordValue.length < 8 || passwordValue.length > 16) {
        setError(password, "Password must be longer 8 and shorter 16 character");
        errorFlag = false;
    } else if (!isValidPassword(passwordValue)) {
        setError(password, "Password must not have spaces");
        errorFlag = false;
    } else {
        setSuccess(password);
    }

    return errorFlag;
};


