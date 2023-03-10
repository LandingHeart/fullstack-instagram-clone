import { createTheme, responsiveFontSizes } from "@mui/material/styles";
import colors from "./colors";

const theme = createTheme({
  typography: {
    h1: {
      fontFamily: "Roboto, sans-serif",
    },
    h2: {
      fontFamily: "Roboto, sans-serif",
    },
    h3: {
      fontFamily: "Roboto, sans-serif",
    },
    h4: {
      fontFamily: "Roboto, sans-serif",
    },
    h5: {
      fontFamily: "Roboto, sans-serif",
    },
    h6: {
      fontFamily: "Roboto, sans-serif",
    },
    subtitle1: { fontFamily: "Roboto, San-Serif", fontSize: "20px" },
    subtitle2: { fontFamily: "Roboto, San-Serif" },
    body1: {
      fontFamily: "Roboto, San-Serif",
      fontSize: "14pxpx",
      fontWeight: "bold",
    },
    body2: {
      fontFamily: "Roboto, San-Serif",
      fontSize: "14px",
    },
  },
  breakpoints: {
    values: {
      xs: 0, // Mobile
      sm: 576, // Mobile Landscape
      md: 768, // Tablet
      lg: 1200, // Desktop
    },
  },
  palette: {
    background: {
      default: colors.orangeLight,
      accent: colors.camelDefault,
      footer: colors.camelDefault,
    },
    primary: {
      main: colors.camelDefault,
      dark: colors.purpleDark,
      light: colors.camelLight,
    },
    secondary: {
      main: "#AD7D86",
      contrastText: colors.grey400,
    },
    error: {
      main: colors.grey300,
    },
    text: {
      primary: colors.coffeeDark,
      secondary: colors.grey200,
      disabled: colors.grey100,
      hint: colors.grey999,
      white: colors.white,
    },
  },
  props: {
    MuiButtonBase: {
      disableRipple: true,
    },
  },
  shadows: Array(25).fill("none"),
  spacing: 8,
});
export default responsiveFontSizes(theme);
