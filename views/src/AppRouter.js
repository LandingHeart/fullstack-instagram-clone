import { Routes, Route } from "react-router-dom";
import BlankPage from "./pages/BlankPage";
import HomePage from "./pages/HomePage";
import Registration from "./components/Registration";

export default function AppRouter() {
  return (
    <Routes>
      <Route path="/" exact element={<HomePage />} />
      <Route path="/blank" exact element={<BlankPage />} />
      <Route path="/register" exact element={<Registration />} />
    </Routes>
  );
}
