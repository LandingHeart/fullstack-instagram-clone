import { createTheme, responsiveFontSizes } from "@mui/material/styles";
import colors from "./colors";

const theme = createTheme({
  breakpoints: {
    values: {
      xs: 0, // Mobile, screen pixel size
      sm: 576, // Mobile Landscape
      md: 768, // Tablet
      lg: 1200, // Desktop
    },
  },
  palette: {
    primary: {
      main: colors.grey700,
      dark: colors.grey600,
    },
    secondary: {
      main: colors.grey500,
      contrastText: colors.grey400,
    },
    error: {
      main: colors.grey300,
    },
    text: {
      primary: colors.grey600,
      secondary: colors.grey200,
      disabled: colors.grey100,
      hint: colors.grey999,
    },
  },
  typography: {
    fontFamily: "'Charis SIL', serif",
    padding: "0px",
    margin: "0px",
    button: {
      textTransform: "none",
    },
  },
  shadows: Array(25).fill("none"),
  spacing: 8,
});

export default responsiveFontSizes(theme);
