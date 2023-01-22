import React from "react";
import { createRoot } from "react-dom";

export default function App() {
    return <h1>テスト</h1>;
}

if (document.getElementById("app")) {
    createRoot(document.getElementById("app")).render(<App />);
}
