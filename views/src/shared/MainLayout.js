import React from "react";
import Navbar from "../components/Navbar";
import { withStyles } from "@mui/styles";
import AppRouter from "../AppRouter";

const styles = (theme) => ({
  main_content_row_container: {
    display: "flex",
    flexDirection: "row",
    justifyContent: "center",
    backgroundColor: "#fff",
    padding: "20px",
  },
  main_content_col: {
    flex: 1,
  },
  main_content_col1: {
    flex: 2,
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    flexDirection: "column",
  },
  main_content_col2: {
    flex: 1,
  },
});
function MainLayout({ children, classes }) {
  return (
    <section className={classes.main_content_row_container}>
      <div className={classes.main_content_col}>
        <Navbar />
      </div>
      <main className={classes.main_content_col1}>
        <AppRouter />
      </main>
      <section className={classes.main_content_col2}>
        <ul>
          <li>a</li>
          <li>b</li>
          <li>b</li>
        </ul>
      </section>
    </section>
  );
}

export default withStyles(styles)(MainLayout);
