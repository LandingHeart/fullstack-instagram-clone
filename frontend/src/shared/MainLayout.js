import React from "react";
import Navbar from "../components/Navbar";
import { withStyles } from "@mui/styles";
const styles = (theme) => ({
  body: {
    backgroundColor: "white",
  },
  navbar_container: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#fff",
    borderBottom: "1px solid rgba(219,219,219, 1)",
    height: "60px",
  },
  main_content_container: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: "#fff",
  },
});
function MainLayout({ children, classes }) {
  return (
    <div className={classes.body}>
      <div className={classes.navbar_container}>
        <Navbar />
      </div>
      <main className={classes.main_content_container}>{children}</main>
    </div>
  );
}

export default withStyles(styles)(MainLayout);
