import axios from "axios";

// const url = "https//localhost:8080";
const url = "fullstack-instagram-clone.herokuapp.com";
// const url = "/";
const api = axios.create({
  baseURL: url,
});

export default api;
