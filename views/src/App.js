import AppRouter from "./AppRouter";
import React from "react";
import theme from "./theme";
import { ThemeProvider } from "@mui/material";
import CssBaseline from "@mui/material/CssBaseline";
import MainLayout from "./shared/MainLayout";

function App() {
  return (
    <ThemeProvider theme={theme}>
      <MainLayout>
        <CssBaseline />
        <AppRouter />
      </MainLayout>
    </ThemeProvider>
  );
}

export default App;
