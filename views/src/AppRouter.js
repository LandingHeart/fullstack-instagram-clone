import { Routes, Route } from "react-router-dom";
import BlankPage from "./pages/blankPage";
import HomePage from "./pages/HomePage";
export default function AppRouter() {
  return (
    <Routes>
      <Route path="/" exact element={<HomePage />} />
      <Route path="/blank" exact element={<BlankPage />} />
    </Routes>
  );
}
