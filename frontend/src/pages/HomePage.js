import React, { useState, useEffect } from "react";
import { Counter } from "../components/Counter";
import MainLayout from "../shared/MainLayout";
import api from "../api";
export default function HomePage() {
  // example usage to pass data down to child
  const [data, setData] = useState([]);

  useEffect(() => {
    api.get("data.json").then((res) => {
      setData(res.data);
    });
  }, []);

  return (
    <MainLayout>
      {/* example passing data down to child as arguments/props */}
      <Counter data={data} />
    </MainLayout>
  );
}
