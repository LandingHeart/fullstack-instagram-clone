import { createTheme, responsiveFontSizes } from "@mui/material/styles";
import colors from "./colors";

const theme = createTheme({
  // MuiUseMediaQuery: { ssrMatchMedia },
  typography: {
    h1: {
      fontFamily: "Montserrat, sans-serif",
    },
    h2: {
      fontFamily: "Montserrat, sans-serif",
    },
    h3: {
      fontFamily: "Montserrat, sans-serif",
    },
    h4: {
      fontFamily: "Montserrat, sans-serif",
    },
    h5: {
      fontFamily: "Montserrat, sans-serif",
    },
    h6: {
      fontFamily: "Montserrat, sans-serif",
    },
    subtitle1: { fontFamily: "Montserrat, San-Serif", fontSize: "20px" },
    subtitle2: { fontFamily: "Montserrat, San-Serif" },
    body1: {
      fontFamily: "Montserrat, San-Serif",
      fontSize: "20px",
    },
    body2: {
      fontFamily: "Montserrat, San-Serif",
      fontSize: "18px",
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
