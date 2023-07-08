const form = document.getElementById("form");
const username = document.getElementById("username");
const password = document.getElementById("password");
const re_pass = document.getElementById("re_pass");
const email = document.getElementById("email");
const phone = document.getElementById("phone");

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
//    console.log(inputControl);

    errorDisplay.innerText = "";
    element.classList.add("success");
    element.classList.remove("error");
};

const isValidEmail = (email) => {
    const re =
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
};
const isValidPhone = (phone) => {
    const re = /^[0-9]{10}$/;
    return re.test(String(phone));
};

const isValidPassword = (password) => {
    const re = /^(?!.*\s).+$/;
    return re.test(String(password));
};
const validateInputs = () => {
    console.log("alooo");

    const usernameValue = username.value.trim();
    const passwordValue = password.value.trim();
    const re_passValue = re_pass.value.trim();
    const emailValue = email.value.trim();
    const phoneValue = phone.value.trim();
    

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

    if (re_passValue === "") {
        setError(re_pass, "Re_password is required");
        errorFlag = false;
    } else if (re_passValue !== passwordValue) {
        setError(re_pass, "Re_password and password is not the same");
        errorFlag = false;
    } else {
        setSuccess(re_pass);
    }

    if (emailValue === "") {
        setError(email, "Email is required and is correct format(EX:abc@gmai.com)");
        errorFlag = false;
    } else if (!isValidEmail(emailValue)) {
        setError(email, "Prove a valid email address");
        errorFlag = false;
    } else {
        setSuccess(email);
    }

    if (phoneValue === "") {
        setError(phone, "Phone is required");
        errorFlag = false;
    } else if (!isValidPhone(phoneValue)) {
        setError(phone, "Prove a valid phone");
        errorFlag = false;
    } else {
        setSuccess(phone);
    }

    return errorFlag;
};
