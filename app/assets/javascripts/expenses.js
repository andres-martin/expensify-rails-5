// add errors styles to modal
const addErrorStyles = (name) => {
    $(`#${name} label`).addClass('text-danger');
    $(`#${name} input`).addClass('error');
}

// add errors to modal
const addErrors = (arrayErrors) => {
    const objErrors = {};
    arrayErrors.forEach((error) => {
        let errorArray = error.split(' ');
        let key = errorArray[0].toLowerCase();
        let errorMsg = errorArray.slice(1).join(" ");

        objErrors[key] = objErrors[key] || errorMsg;

        addErrorStyles(key);
        $(`#${key} p`).text(`${objErrors[key]}`).show();
    });
};

// dismiss alerts

function dismissAlert() {
    $('.alert button').on('click', () => {
        $('.alert').css('display', 'none');
    });
}
