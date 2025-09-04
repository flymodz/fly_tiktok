CREATE TABLE IF NOT EXISTS tiktok_rewards (
    identifier VARCHAR(60) PRIMARY KEY,
    claimed BOOLEAN DEFAULT FALSE
);