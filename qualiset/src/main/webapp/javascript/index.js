const chatbotToggler = document.querySelector(".chatbot-toggler");
const closeBtn = document.querySelector(".close-btn");
const chatbox = document.querySelector(".chatbox");
const chatInput = document.querySelector(".chat-input textarea");
const sendChatBtn = document.querySelector(".chat-input span");

let userMessage = null;

const inputInitHeight = chatInput.scrollHeight;

const createChatLi = (message, className) => {

    const chatLi = document.createElement("li");
    chatLi.classList.add("chat", `${className}`);
    let chatContent = className === "outgoing" ? `<p></p>` : `<span class="material-symbols-outlined">smart_toy</span><p></p>`;
    chatLi.innerHTML = chatContent;
    chatLi.querySelector("p").textContent = message;
    return chatLi;
}

const generateResponse = (chatElement) => {

    const messageElement = chatElement.querySelector("p");

    if (userMessage == "Quero saber mais sobre a loja.") {
        messageElement.textContent = "Somos a Qualiset e somos pika";
    } else if (userMessage == "O que vocês vendem?") {
        messageElement.textContent = "Basicamente de tudo do mundo do mundo fitness.";
    }else if (userMessage == "Seus produtos são bons?") {
        messageElement.textContent = "São os melhores possíveis.";
    }else if (userMessage == "Qual é o diferencial de vocês?") {
        messageElement.textContent = "Temos a melhor proteína do mercado.";
    }else if (userMessage == "Por onde posso falar com um representante?") {
        messageElement.textContent = "Pelo Whatsapp: (11) 92388-4241";
    }else{
        messageElement.classList.add("error");
        messageElement.textContent = "Hmm... Desculpe, não aprendi o que é isso ainda.";
    }
}

const handleChat = () => {
    userMessage = chatInput.value.trim();
    if (!userMessage) return;


    chatInput.value = "";
    chatInput.style.height = `${inputInitHeight}px`;


    chatbox.appendChild(createChatLi(userMessage, "outgoing"));
    chatbox.scrollTo(0, chatbox.scrollHeight);

    setTimeout(() => {

        const incomingChatLi = createChatLi("Pensando...", "incoming");
        chatbox.appendChild(incomingChatLi);
        chatbox.scrollTo(0, chatbox.scrollHeight);
        generateResponse(incomingChatLi);
    }, 20);

}

chatInput.addEventListener("input", () => {

    chatInput.style.height = `${inputInitHeight}px`;
    chatInput.style.height = `${chatInput.scrollHeight}px`;
});

chatInput.addEventListener("keydown", (e) => {

    if (e.key === "Enter" && !e.shiftKey && window.innerWidth > 800) {
        e.preventDefault();
        handleChat();
    }
});

sendChatBtn.addEventListener("click", handleChat);
closeBtn.addEventListener("click", () => document.body.classList.remove("show-chatbot"));
chatbotToggler.addEventListener("click", () => document.body.classList.toggle("show-chatbot"));


const wrapper = document.querySelector(".wrapper"),
    carousel = document.querySelector(".carousel"),
    images = document.querySelectorAll("img"),
    buttons = document.querySelectorAll(".button");
let imageIndex = 1,
    intervalId;

const autoSlide = () => {

    intervalId = setInterval(() => slideImage(++imageIndex), 6000);
};

autoSlide();


const slideImage = () => {
    imageIndex = imageIndex === images.length ? 0 : imageIndex < 0 ? images.length - 1 : imageIndex;
    carousel.style.transform = `translate(-${imageIndex * 100}%)`;
};

const updateClick = (e) => {

    clearInterval(intervalId);

    const nextIndex = e.target.id === "next" ? imageIndex + 1 : imageIndex - 1;

    imageIndex = nextIndex;

    slideImage();
    autoSlide();
};

buttons.forEach((button) => button.addEventListener("click", updateClick));

wrapper.addEventListener("mouseover", () => clearInterval(intervalId));

wrapper.addEventListener("mouseleave", autoSlide);