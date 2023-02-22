import React from "react";
import Navbar from "../components/Navbar";
import { withStyles } from "@mui/styles";
const styles = (theme) => ({
  body: {
    backgroundColor: "white",
  },
  main_content_container: {
    display: "flex",
    flexDirection: "row",
    justifyContent: "center",
    backgroundColor: "#fff",
  },
});
function MainLayout({ children, classes }) {
  return (
    <div className={classes.body}>
      <Navbar />
      <main className={classes.main_content_container}>
        <section className={classes.main_content_col1}>{children}</section>
        <section className={classes.main_content_col2}>
          <ul>
            <li>a</li>
            <li>b</li>
            <li>b</li>
          </ul>
        </section>
      </main>
    </div>
  );
}

export default withStyles(styles)(MainLayout);
