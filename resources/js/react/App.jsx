import React from "react";
import { createRoot } from "react-dom";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Home from "./app/Hello";

export default function App() {
    return (
        <Routes>
            <Route path="/" element={<Home />} />
        </Routes>
    );
}

if (document.getElementById("app")) {
    createRoot(document.getElementById("app")).render(
        <BrowserRouter>
            <App />
        </BrowserRouter>
    );
}
